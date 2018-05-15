struct PropertyDescriptor: Decodable {
    let description: String?
    let format: String?
    let type: SchemaDescriptor

    enum PropertyKeys: String, CodingKey {
        case description
        case type
        case items
        case reference = "$ref"
        case format
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PropertyKeys.self)
        let allKeys = container.allKeys

        if allKeys.contains(.items) {
            let itemContainer = try container.nestedContainer(keyedBy: PropertyKeys.self, forKey: .items)
            if let referenceType = try? itemContainer.decode(String.self, forKey: .reference) {
                self.type = .referenceArray(type: referenceType)
            } else if let rawType = try? itemContainer.decode(String.self, forKey: .type) {
                self.type = .array(type: rawType)
            } else {
                self.type = .raw("Unknown", nil)
            }
        } else if container.allKeys.contains(.type) {
            let rawType = try container.decode(String.self, forKey: .type)
            self.type = .raw(rawType, nil)
        } else {
            let referenceType = try container.decode(String.self, forKey: .reference)
            self.type = .reference(referenceType)
        }

        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.format = try container.decodeIfPresent(String.self, forKey: .format)
    }
}
