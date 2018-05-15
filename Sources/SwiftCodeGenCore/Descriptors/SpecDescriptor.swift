public struct SpecDescriptor: Decodable {
    let host: String
    let basePath: String
    let paths: DecodableDictionary<DecodableDictionary<TargetDescriptor>>
    let definitions: DecodableDictionary<DefinitionDesctiptor>
}
