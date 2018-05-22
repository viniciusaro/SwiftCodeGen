struct TargetDescriptor: Decodable {
    let summary: String?
    let description: String?
    let tags: [String]
    let consumes: [String]?
    let produces: [String]
    let parameters: [ParameterDescriptor]?
    let responses: DecodableDictionary<ResponseDescriptor>
}
