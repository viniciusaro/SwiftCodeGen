public struct MoyaSpec {
    let host: String
    let basePath: String?
    let targets: [Target]
    let repositories: [Repository]
    let definitions: [Definition]

    public init(specParser: MoyaSpecParser, descriptor: SpecDescriptor) {
        self.host = descriptor.host
        self.basePath = descriptor.basePath
        self.targets = specParser.targetsFrom(descriptor: descriptor)
        self.repositories = specParser.repositoriesFrom(descriptor: descriptor)
        self.definitions = specParser.definitionsFrom(descriptor: descriptor)
    }
}
