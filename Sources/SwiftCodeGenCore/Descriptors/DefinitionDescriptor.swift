struct DefinitionDesctiptor: Decodable {
    let description: String?
    let required: [String]?
    let type: String
    let properties: DecodableDictionary<PropertyDescriptor>?
}
