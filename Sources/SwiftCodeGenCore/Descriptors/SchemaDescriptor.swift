enum SchemaDescriptor: Decodable {
    indirect case raw(String, PropertyDescriptor?)
    case reference(String)
    case array(type: String)
    case referenceArray(type: String)

    enum SchemaKeys: String, CodingKey {
        case type
        case items
        case reference = "$ref"
        case additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SchemaKeys.self)
        let allKeys = container.allKeys

        if allKeys.contains(.reference) {
            let rawType = try container.decode(String.self, forKey: .reference)
            self = .reference(rawType)
            return
        }

        if allKeys.contains(.items) {
            let itemContainer = try container.nestedContainer(keyedBy: SchemaKeys.self, forKey: .items)
            if let referenceType = try? itemContainer.decode(String.self, forKey: .reference) {
                self = .referenceArray(type: referenceType)
                return
            } else if let rawType = try? itemContainer.decode(String.self, forKey: .type) {
                self = .array(type: rawType)
                return
            }
        }

        if allKeys.contains(.type) {
            let type = try container.decode(String.self, forKey: .type)
            let additionalPropertiesDescriptor = try container.decodeIfPresent(PropertyDescriptor.self, forKey: .additionalProperties)
            self = .raw(type, additionalPropertiesDescriptor)
            return
        }

        self = .reference("Unknown")
    }
}
