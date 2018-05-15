struct Repository: CustomDebugStringConvertible {
    let name: String
    let methods: [RepositoryMethod]

    var debugDescription: String {
        return """
        \n
        \(self.name)
            \(self.methods)
        """
    }
}
