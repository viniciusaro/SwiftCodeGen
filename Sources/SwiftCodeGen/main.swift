import SwiftCLI

let version = "1.0.0"
let commands = [GenerateCommand()]
let name = "swiftcodegen"
let description = "Swift code generation tools"
let cli = CLI(name: name, version: version, description: description, commands: commands)
cli.goAndExit()
