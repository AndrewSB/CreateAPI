// The MIT License (MIT)
//
// Copyright (c) 2021 Alexander Grebenyuk (github.com/kean).

import Foundation
import OpenAPIKit30

// Experimental.
final class ParallelDocumentParser: Decodable {
    let document: OpenAPI.Document
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let version = try container.decode(OpenAPI.Document.Version.self, forKey: .openAPIVersion)
        let info = try container.decode(OpenAPI.Document.Info.self, forKey: .info)
        
        let group = DispatchGroup()
        
        var components: Result<OpenAPI.Components, Error>!
        perform(in: group) {
            components = Result(catching: { try container.decodeIfPresent(ParallelComponentsParser.self, forKey: .components)?.components ?? .noComponents })
        }
        
        var paths: Result<OpenAPI.PathItem.Map, Error>!
        perform(in: group) {
            paths = Result(catching: { try container.decode(OpenAPI.PathItem.Map.self, forKey: .paths) })
        }

        group.wait()
                
        // Skip fields that we don't need for code generation

        self.document = OpenAPI.Document(
            openAPIVersion: version,
            info: info,
            servers: [],
            paths: try paths.get(),
            components: try components.get(),
            security: [],
            tags: nil,
            externalDocs: nil,
            vendorExtensions: [:]
        )
    }
    
    enum CodingKeys: String, CodingKey {
        case openAPIVersion = "openapi"
        case info
        case paths
        case components
    }
}

// Experimental.
final class ParallelComponentsParser: Decodable {
    let components: OpenAPI.Components
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let group = DispatchGroup()
        var schemas: Result<OpenAPI.ComponentDictionary<JSONSchema>, Error>!
        perform(in: group) {
            schemas = Result(catching: { try container.decodeIfPresent(OpenAPI.ComponentDictionary<JSONSchema>.self, forKey: .schemas) ?? [:] })
        }
        
        var examples: Result<OpenAPI.ComponentDictionary<OpenAPI.Example>, Error>!
        perform(in: group) {
            examples = Result(catching: { try container.decodeIfPresent(OpenAPI.ComponentDictionary<OpenAPI.Example>.self, forKey: .examples)
                ?? [:] })
        }
        
        var parameters: Result<OpenAPI.ComponentDictionary<OpenAPI.Parameter>, Error>!
        var requestBodies: Result<OpenAPI.ComponentDictionary<OpenAPI.Request>, Error>!
        var responses: Result<OpenAPI.ComponentDictionary<OpenAPI.Response>, Error>!
        var headers: Result<OpenAPI.ComponentDictionary<OpenAPI.Header>, Error>!
        perform(in: group) {
            responses = Result(catching: { try container.decodeIfPresent(OpenAPI.ComponentDictionary<OpenAPI.Response>.self, forKey: .responses)
                ?? [:]})
            parameters = Result(catching: { try  container.decodeIfPresent(OpenAPI.ComponentDictionary<OpenAPI.Parameter>.self, forKey: .parameters)
                ?? [:] })
            requestBodies = Result(catching: { try container.decodeIfPresent(OpenAPI.ComponentDictionary<OpenAPI.Request>.self, forKey: .requestBodies)
                ?? [:] })
            headers = Result(catching: { try container.decodeIfPresent(OpenAPI.ComponentDictionary<OpenAPI.Header>.self, forKey: .headers)
                ?? [:] })
        }
        
        group.wait()
        
        self.components = OpenAPI.Components(
            schemas: try schemas.get(),
            responses: try responses.get(),
            parameters: try parameters.get(),
            examples: try examples.get(),
            requestBodies: try requestBodies.get(),
            headers: try headers.get(),
            securitySchemes: [:],
            callbacks: [:],
            vendorExtensions: [:]
        )
    }
    
    enum CodingKeys: String, CodingKey {
        case schemas
        case responses
        case parameters
        case examples
        case requestBodies
        case headers
        case securitySchemes
        case links
        case callbacks
    }
}

private final class ResultBox<T> {
    var value: Result<T, Error>!
    
    func get() throws -> T {
        try value.get()
    }
}

private func perform(in group: DispatchGroup, _ closure: @escaping () -> Void) {
    group.enter()
    DispatchQueue.global().async {
        closure()
        group.leave()
    }
}

// MARK: Strings

/// A camel-case  type name.
///
/// Using these types add type-safety and allows the client to avoid redundant computations.
struct TypeName: CustomStringConvertible {
    let rawValue: String
    
    init(_ key: OpenAPI.ComponentKey) {
        self.init(key.rawValue)
    }
    
    init(_ rawValue: String) {
        self.rawValue = rawValue.process(isProperty: false)
    }

    init(processedRawValue: String) {
        self.rawValue = processedRawValue
    }

    var description: String { rawValue }
    
    // Appends the name without re-doing most of the processing.
    func appending(_ text: String) -> TypeName {
        TypeName(processedRawValue: rawValue + text)
    }
}

/// A property/parameter name in a camel-case format, e.g. `gistsURL`.
///
/// If the name matches one of the Swift keywords, it's automatically escaped.
struct PropertyName: CustomStringConvertible {
    let rawValue: String
    
    init(_ rawValue: String) {
        self.rawValue = rawValue.process(isProperty: true)
    }
    
    init(processedRawValue: String) {
        self.rawValue = processedRawValue
    }
    
    var description: String { rawValue }
    
    func asBoolean() -> PropertyName {
        var string = rawValue.trimmingCharacters(in: ticks)
        let words = string.words
        guard !words.isEmpty else {
            return self
        }
        if words.contains(where: booleanExceptions.contains) {
            return self
        }
        let first = words[0]
        if abbreviations.contains(first.lowercased()) {
            string.removeFirst(first.count)
            string = first.uppercased() + string
        }
        return PropertyName(processedRawValue: "is" + string.capitalizingFirstLetter())
    }
}

// We can't list everything, but these are the most common words
private let booleanExceptions = Set(["is", "has", "have", "allow", "allows", "enable", "enables", "require", "requires", "delete", "deletes", "can", "should", "use", "uses", "contain", "contains", "dismiss", "dismisses", "respond", "responds", "exclude", "excludes", "lock", "locks", "was", "were", "enforce", "enforces", "resolve", "resolves"])

private extension String {
    var words: [String] {
        var output: [String] = []
        var remainig = self[...]
        while let index = remainig.firstIndex(where: { $0.isUppercase }) {
            output.append(String(remainig[..<index]))
            if !remainig.isEmpty {
                let start = remainig.startIndex
                remainig.replaceSubrange(start...start, with: remainig[start].lowercased())
            }
            remainig = remainig[index...]
        }
        if !remainig.isEmpty {
            output.append(String(remainig))
        }
        return output
    }
    
    var sanitized: String {
        if let replacement = replacements[self] {
            return replacement
        }
        
        if first == "+" {
            return "plus\(dropFirst())"
        }
        if first == "-" {
            return "minus\(dropFirst())"
        }
        return self
    }
    
    var escapedPropertyName: String {
        guard keywords.contains(self.lowercased()) else { return self }
        return "`\(self)`"
    }
    
    var escapedTypeName: String {
        if capitilizedKeywords.contains(self) {
            return "`\(self)`"
        }
        return self
    }

    func process(isProperty: Bool) -> String {
        // Special-case: remove `'` from words like "won't"
        var components = sanitized.replacingOccurrences(of: "'", with: "")
            .components(separatedBy: badCharacters)
        // If all letters are uppercased (but skip one-letter words)
        if !components.contains(where: { $0.count > 1 && $0.contains(where: { $0.isLowercase }) }) {
            components = components.map { $0.lowercased() }
        }
        // To camelCase
        var output = components
            .filter { !$0.isEmpty }
            .enumerated()
            .map { index, string in
                // Special-case for abbreviations, e.g. "URL"
                if (!isProperty || index != 0) && abbreviations.contains(string.lowercased()) {
                    return string.uppercased()
                }
                if (isProperty && index == 0) {
                    return string.lowercasedFirstLetter()
                }
                return string.capitalizingFirstLetter()
            }
            .joined(separator: "")
        guard let first = output.first else {
            return output
        }
        // Make sure it starts with a valid chatecter, e.g. "213List" doesn't pass.
        if !CharacterSet(charactersIn: String(first)).isSubset(of: .letters) {
            output = "_" + output
        }
        output = isProperty ? output.escapedPropertyName : output.escapedTypeName
        return output
    }
    
    func capitalizingFirstLetter() -> String {
        prefix(1).capitalized + dropFirst()
    }

    func lowercasedFirstLetter() -> String {
        prefix(1).lowercased() + dropFirst()
    }
}

extension String {
    func shiftedRight(count: Int) -> String {
        guard count > 0 else {
            return self
        }
        return components(separatedBy: "\n")
            .map { $0.isEmpty ? $0 : String(repeating: " ", count: count) + $0 }
            .joined(separator: "\n")
    }
}

private let keywords = Set(["public", "private", "open", "fileprivate", "default", "extension", "import", "init", "deinit", "typealias", "let", "var", "in", "return", "for", "switch", "enum", "struct", "class", "if", "self", "none"])

private let capitilizedKeywords = Set(["Self", "Type"])

private let abbreviations = Set(["url", "id", "html", "ssl", "tls", "http", "https", "dns", "ftp"])

// In reality, no one should be using case names like this.
private let replacements: [String: String] = [
    ">=": "greaterThanOrEqualTo",
    "<=": "lessThanOrEqualTo",
    ">": "greaterThan",
    "<": "lessThan",
    "$": "dollar",
    "%": "percent",
    "#": "hash",
    "@": "alpha",
    "&": "and",
    "-": "munus",
    "+": "plus"
]

private let badCharacters = CharacterSet.alphanumerics.inverted

private let ticks = CharacterSet(charactersIn: "`")

func concurrentPerform<T>(on array: [T], parallel: Bool, _ work: (Int, T) -> Void) {
    let coreCount = suggestedCoreCount
    let iterations = !parallel ? 1 : (array.count > (coreCount * 2) ? coreCount : 1)
    
    DispatchQueue.concurrentPerform(iterations: iterations) { index in
        let start = index * array.indices.count / iterations
        let end = (index + 1) * array.indices.count / iterations
        for index in start..<end {
            work(index, array[index])
        }
    }
}

// TODO: Find a better way to do concurrent perform.
var suggestedCoreCount: Int {
    ProcessInfo.processInfo.processorCount
}

let anyJSON = """
public enum AnyJSON: Equatable {
    case string(String)
    case number(Double)
    case object([String: AnyJSON])
    case array([AnyJSON])
    case bool(Bool)

    var value: Any {
        switch self {
        case .string(let string): return string
        case .number(let double): return double
        case .object(let dictionary): return dictionary
        case .array(let array): return array
        case .bool(let bool): return bool
        }
    }
}

extension AnyJSON: Codable {
    public func encode(to encoder: Encoder) throws {

        var container = encoder.singleValueContainer()

        switch self {
        case let .array(array):
            try container.encode(array)
        case let .object(object):
            try container.encode(object)
        case let .string(string):
            try container.encode(string)
        case let .number(number):
            try container.encode(number)
        case let .bool(bool):
            try container.encode(bool)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let object = try? container.decode([String: AnyJSON].self) {
            self = .object(object)
        } else if let array = try? container.decode([AnyJSON].self) {
            self = .array(array)
        } else if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else if let number = try? container.decode(Double.self) {
            self = .number(number)
        } else {
            throw DecodingError.dataCorrupted(
                .init(codingPath: decoder.codingPath, debugDescription: "Invalid JSON value.")
            )
        }
    }
}

extension AnyJSON: CustomDebugStringConvertible {

    public var debugDescription: String {
        switch self {
        case .string(let str):
            return str.debugDescription
        case .number(let num):
            return num.debugDescription
        case .bool(let bool):
            return bool.description
        default:
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted]
            return try! String(data: encoder.encode(self), encoding: .utf8)!
        }
    }
}
"""

let stringCodingKey = """
struct StringCodingKey: CodingKey, ExpressibleByStringLiteral {
    private let string: String
    private var int: Int?

    var stringValue: String { return string }

    init(string: String) {
        self.string = string
    }

    init?(stringValue: String) {
        self.string = stringValue
    }

    var intValue: Int? { return int }

    init?(intValue: Int) {
        self.string = String(describing: intValue)
        self.int = intValue
    }

    init(stringLiteral value: String) {
        self.string = value
    }
}
"""
