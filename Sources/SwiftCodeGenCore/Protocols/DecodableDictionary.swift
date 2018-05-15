struct DecodableDictionary<T: Decodable>: Decodable {
    let values: [String: T]

    struct DynamicKey: CodingKey {
        var stringValue: String
        init?(stringValue: String) { self.stringValue = stringValue }
        var intValue: Int? { return nil }
        init?(intValue: Int) { return nil }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicKey.self)
        var values: [String: T] = [:]
        for key in container.allKeys {
            let value = try container.decode(T.self, forKey: key)
            values[key.stringValue] = value
        }
        self.values = values
    }
}
