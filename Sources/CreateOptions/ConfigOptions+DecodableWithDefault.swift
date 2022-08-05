// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable all

extension ConfigOptions: Decodable {
    enum KnownKeys: String {
        case access
        case annotateDeprecations
        case generateEnums
        case useSwiftyPropertyNames
        case inlineTypealiases
        case acronyms
        case indentation
        case spaceWidth
        case pluralizeProperties
        case useNaiveDate
        case useFixWidthIntegers
        case fileHeaderComment
        case commentOptions
        case entities
        case paths
        case rename
    }

    public init(from decoder: Decoder) throws {
        let container = try StringCodingContainer<KnownKeys>(decoder: decoder)

        access = try container.decode(String.self,
            forKey: .access,
            defaultValue: "public"
        )

        annotateDeprecations = try container.decode(Bool.self,
            forKey: .annotateDeprecations,
            defaultValue: true
        )

        generateEnums = try container.decode(Bool.self,
            forKey: .generateEnums,
            defaultValue: true
        )

        useSwiftyPropertyNames = try container.decode(Bool.self,
            forKey: .useSwiftyPropertyNames,
            defaultValue: true
        )

        inlineTypealiases = try container.decode(Bool.self,
            forKey: .inlineTypealiases,
            defaultValue: true
        )

        acronyms = try container.decode([String].self,
            forKey: .acronyms,
            defaultValue: ["url", "id", "html", "ssl", "tls", "https", "http", "dns", "ftp", "api", "uuid", "json"]
        )

        indentation = try container.decode(ConfigOptions.Indentation.self,
            forKey: .indentation,
            defaultValue: .spaces
        )

        spaceWidth = try container.decode(Int.self,
            forKey: .spaceWidth,
            defaultValue: 4
        )

        pluralizeProperties = try container.decode(Bool.self,
            forKey: .pluralizeProperties,
            defaultValue: true
        )

        useNaiveDate = try container.decode(Bool.self,
            forKey: .useNaiveDate,
            defaultValue: true
        )

        useFixWidthIntegers = try container.decode(Bool.self,
            forKey: .useFixWidthIntegers,
            defaultValue: false
        )

        fileHeaderComment = try container.decode(String.self,
            forKey: .fileHeaderComment,
            defaultValue: "// Generated by Create API\n// https://github.com/CreateAPI/CreateAPI"
        )

        commentOptions = try container.decode(Set<CommentOption>.self,
            forKey: .commentOptions,
            defaultValue: [.title, .description, .example, .externalDocumentation, .capitalized]
        )

        entities = try container.decode(Entities.self,
            forKey: .entities,
            defaultValue: .init()
        )

        paths = try container.decode(Paths.self,
            forKey: .paths,
            defaultValue: .init()
        )

        rename = try container.decode(Rename.self,
            forKey: .rename,
            defaultValue: .init()
        )

        container.recordPotentialIssues(
            deprecations: [
            ],
            replacements: [
                ("isAddingDeprecations", "Use 'annotateDeprecations' instead."),
                ("isGeneratingEnums", "Use 'generateEnums' instead."),
                ("isGeneratingSwiftyBooleanPropertyNames", "Use 'useSwiftyPropertyNames' instead."),
                ("isInliningTypealiases", "Use 'inlineTypealiases' instead."),
                ("isPluralizationEnabled", "Use 'pluralizeProperties' instead."),
                ("isNaiveDateEnabled", "Use 'useNaiveDate' instead."),
                ("isUsingIntegersWithPredefinedCapacity", "Use 'useFixWidthIntegers' instead."),
                ("comments", "Use 'commentOptions' instead."),
                ("addedAcronyms", "Replaced by 'acronyms'."),
                ("ignoredAcronyms", "Replaced by 'acronyms'."),
                ("isReplacingCommonAcronyms", "Replaced by 'acronyms'."),
                ("isSwiftLintDisabled", "Add to 'fileHeaderComment' instead."),
            ]
        )
    }
}

extension ConfigOptions.Entities: Decodable {
    enum KnownKeys: String {
        case generateStructs
        case entitiesGeneratedAsClasses
        case entitiesGeneratedAsStructs
        case imports
        case finalClasses
        case mutableClassProperties
        case mutableStructProperties
        case baseClass
        case protocols
        case includeIdentifiableConformance
        case skipRedundantProtocols
        case includeInitializer
        case alwaysIncludeDecodableImplementation
        case alwaysIncludeEncodableImplementation
        case sortPropertiesAlphabetically
        case optimizeCodingKeys
        case includeDefaultValues
        case inlineReferencedSchemas
        case stripParentNameInNestedObjects
        case exclude
        case include
        case filenameTemplate
    }

    public init(from decoder: Decoder) throws {
        let container = try StringCodingContainer<KnownKeys>(decoder: decoder)

        generateStructs = try container.decode(Bool.self,
            forKey: .generateStructs,
            defaultValue: true
        )

        entitiesGeneratedAsClasses = try container.decode(Set<String>.self,
            forKey: .entitiesGeneratedAsClasses,
            defaultValue: []
        )

        entitiesGeneratedAsStructs = try container.decode(Set<String>.self,
            forKey: .entitiesGeneratedAsStructs,
            defaultValue: []
        )

        imports = try container.decode(Set<String>.self,
            forKey: .imports,
            defaultValue: []
        )

        finalClasses = try container.decode(Bool.self,
            forKey: .finalClasses,
            defaultValue: true
        )

        mutableClassProperties = try container.decode(Bool.self,
            forKey: .mutableClassProperties,
            defaultValue: false
        )

        mutableStructProperties = try container.decode(Bool.self,
            forKey: .mutableStructProperties,
            defaultValue: true
        )

        baseClass = try container.decode(String?.self,
            forKey: .baseClass,
            defaultValue: nil
        )

        protocols = try container.decode(Set<String>.self,
            forKey: .protocols,
            defaultValue: ["Codable"]
        )

        includeIdentifiableConformance = try container.decode(Bool.self,
            forKey: .includeIdentifiableConformance,
            defaultValue: false
        )

        skipRedundantProtocols = try container.decode(Bool.self,
            forKey: .skipRedundantProtocols,
            defaultValue: true
        )

        includeInitializer = try container.decode(Bool.self,
            forKey: .includeInitializer,
            defaultValue: true
        )

        alwaysIncludeDecodableImplementation = try container.decode(Bool.self,
            forKey: .alwaysIncludeDecodableImplementation,
            defaultValue: true
        )

        alwaysIncludeEncodableImplementation = try container.decode(Bool.self,
            forKey: .alwaysIncludeEncodableImplementation,
            defaultValue: true
        )

        sortPropertiesAlphabetically = try container.decode(Bool.self,
            forKey: .sortPropertiesAlphabetically,
            defaultValue: false
        )

        optimizeCodingKeys = try container.decode(Bool.self,
            forKey: .optimizeCodingKeys,
            defaultValue: false
        )

        includeDefaultValues = try container.decode(Bool.self,
            forKey: .includeDefaultValues,
            defaultValue: true
        )

        inlineReferencedSchemas = try container.decode(Bool.self,
            forKey: .inlineReferencedSchemas,
            defaultValue: false
        )

        stripParentNameInNestedObjects = try container.decode(Bool.self,
            forKey: .stripParentNameInNestedObjects,
            defaultValue: false
        )

        exclude = try container.decode(Set<String>.self,
            forKey: .exclude,
            defaultValue: []
        )

        include = try container.decode(Set<String>.self,
            forKey: .include,
            defaultValue: []
        )

        filenameTemplate = try container.decode(String.self,
            forKey: .filenameTemplate,
            defaultValue: "%0.swift"
        )

        container.recordPotentialIssues(
            deprecations: [
            ],
            replacements: [
                ("isGeneratingStructs", "Use 'generateStructs' instead."),
                ("isMakingClassesFinal", "Use 'finalClasses' instead."),
                ("isGeneratingMutableClassProperties", "Use 'mutableClassProperties' instead."),
                ("isGeneratingMutableStructProperties", "Use 'mutableStructProperties' instead."),
                ("isGeneratingIdentifiableConformance", "Use 'includeIdentifiableConformance' instead."),
                ("isSkippingRedundantProtocols", "Use 'skipRedundantProtocols' instead."),
                ("isGeneratingInitializers", "Use 'includeInitializer' instead."),
                ("isGeneratingInitWithDecoder", "Use 'alwaysIncludeDecodableImplementation' instead."),
                ("isGeneratingEncodeWithEncoder", "Use 'alwaysIncludeEncodableImplementation' instead."),
                ("isSortingPropertiesAlphabetically", "Use 'sortPropertiesAlphabetically' instead."),
                ("isGeneratingCustomCodingKeys", "Use 'optimizeCodingKeys' instead."),
                ("isAddingDefaultValues", "Use 'includeDefaultValues' instead."),
                ("isInliningPropertiesFromReferencedSchemas", "Use 'inlineReferencedSchemas' instead."),
                ("isStrippingParentNameInNestedObjects", "Use 'stripParentNameInNestedObjects' instead."),
                ("isAdditionalPropertiesOnByDefault", "Enabled by default."),
            ]
        )
    }
}

extension ConfigOptions.Paths: Decodable {
    enum KnownKeys: String {
        case style
        case namespace
        case includeResponseHeaders
        case imports
        case overriddenResponses
        case overriddenBodyTypes
        case inlineSimpleRequests
        case inlineSimpleQueryParameters
        case simpleQueryParametersThreshold
        case makeOptionalPatchParametersDoubleOptional
        case removeRedundantPaths
        case exclude
        case include
        case filenameTemplate
    }

    public init(from decoder: Decoder) throws {
        let container = try StringCodingContainer<KnownKeys>(decoder: decoder)

        style = try container.decode(ConfigOptions.PathsStyle.self,
            forKey: .style,
            defaultValue: .rest
        )

        namespace = try container.decode(String.self,
            forKey: .namespace,
            defaultValue: "Paths"
        )

        includeResponseHeaders = try container.decode(Bool.self,
            forKey: .includeResponseHeaders,
            defaultValue: true
        )

        imports = try container.decode(Set<String>.self,
            forKey: .imports,
            defaultValue: ["Get"]
        )

        overriddenResponses = try container.decode([String: String].self,
            forKey: .overriddenResponses,
            defaultValue: [:]
        )

        overriddenBodyTypes = try container.decode([String: String].self,
            forKey: .overriddenBodyTypes,
            defaultValue: [:]
        )

        inlineSimpleRequests = try container.decode(Bool.self,
            forKey: .inlineSimpleRequests,
            defaultValue: true
        )

        inlineSimpleQueryParameters = try container.decode(Bool.self,
            forKey: .inlineSimpleQueryParameters,
            defaultValue: true
        )

        simpleQueryParametersThreshold = try container.decode(Int.self,
            forKey: .simpleQueryParametersThreshold,
            defaultValue: 2
        )

        makeOptionalPatchParametersDoubleOptional = try container.decode(Bool.self,
            forKey: .makeOptionalPatchParametersDoubleOptional,
            defaultValue: false
        )

        removeRedundantPaths = try container.decode(Bool.self,
            forKey: .removeRedundantPaths,
            defaultValue: true
        )

        exclude = try container.decode(Set<String>.self,
            forKey: .exclude,
            defaultValue: []
        )

        include = try container.decode(Set<String>.self,
            forKey: .include,
            defaultValue: []
        )

        filenameTemplate = try container.decode(String.self,
            forKey: .filenameTemplate,
            defaultValue: "%0.swift"
        )

        container.recordPotentialIssues(
            deprecations: [
            ],
            replacements: [
                ("isGeneratingResponseHeaders", "Use 'includeResponseHeaders' instead."),
                ("overridenResponses", "Use 'overriddenResponses' instead."),
                ("overridenBodyTypes", "Use 'overriddenBodyTypes' instead."),
                ("isInliningSimpleRequests", "Use 'inlineSimpleRequests' instead."),
                ("isInliningSimpleQueryParameters", "Use 'inlineSimpleQueryParameters' instead."),
                ("isMakingOptionalPatchParametersDoubleOptional", "Use 'makeOptionalPatchParametersDoubleOptional' instead."),
                ("isRemovingRedundantPaths", "Use 'removeRedundantPaths' instead."),
                ("isAddingOperationIds", "Enabled by default."),
            ]
        )
    }
}

extension ConfigOptions.Rename: Decodable {
    enum KnownKeys: String {
        case properties
        case parameters
        case enumCases
        case entities
        case operations
        case collectionElements
    }

    public init(from decoder: Decoder) throws {
        let container = try StringCodingContainer<KnownKeys>(decoder: decoder)

        properties = try container.decode([String: String].self,
            forKey: .properties,
            defaultValue: [:]
        )

        parameters = try container.decode([String: String].self,
            forKey: .parameters,
            defaultValue: [:]
        )

        enumCases = try container.decode([String: String].self,
            forKey: .enumCases,
            defaultValue: [:]
        )

        entities = try container.decode([String: String].self,
            forKey: .entities,
            defaultValue: [:]
        )

        operations = try container.decode([String: String].self,
            forKey: .operations,
            defaultValue: [:]
        )

        collectionElements = try container.decode([String: String].self,
            forKey: .collectionElements,
            defaultValue: [:]
        )

        container.recordPotentialIssues(
            deprecations: [
            ],
            replacements: [
            ]
        )
    }
}

