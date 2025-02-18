// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct A: Codable {
    public var someKind: String

    public init(someKind: String) {
        self.someKind = someKind
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.someKind = try values.decode(String.self, forKey: "some_kind")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(someKind, forKey: "some_kind")
    }
}
