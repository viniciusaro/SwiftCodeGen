struct ParameterDescriptor: Decodable {
    let name: String
    let type: ParameterDescriptorType
    let format: String?
    let `in`: String?
    let required: Bool

    enum ParameterKeys: String, CodingKey {
        case type
        case format
        case name
        case schema
        case `in`
        case required
        case items
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ParameterKeys.self)
        let allKeys = container.allKeys

        if allKeys.contains(.schema) {
            let schema = try container.decode(SchemaDescriptor.self, forKey: .schema)
            self.type = .schema(schema)
        } else {
            let rawType = try container.decode(String.self, forKey: .type)
            self.type = .raw(rawType)
        }

        self.name = try container.decode(String.self, forKey: .name)
        self.format = try container.decodeIfPresent(String.self, forKey: .format)
        self.in = try container.decodeIfPresent(String.self, forKey: .in)
        self.required = try container.decode(Bool.self, forKey: .required)
    }
}
