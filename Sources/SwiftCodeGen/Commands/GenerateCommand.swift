import SwiftCLI
import Foundation
import PathKit
import SwiftCodeGenCore

enum SwiftCodegenError: Error {
    case invalidSwaggerSpecPath(String)
}

final class GenerateCommand: Command {
    let name = "generate"
    let shortDescription = "Moya interface from Swagger spec"

    private let specPathParameter = SwiftCLI.Parameter()
    private let generatedPathParameter = Key<String>("--output", "-o", description: "Output path for generated files")
    private let binaryRoot = Bundle.main.bundlePath

    func execute() throws {
        let contents = try String(contentsOfFile: try self.specPath(), encoding: .utf8)
        let data = contents.data(using: .utf8)!

        let specDescriptor = try JSONDecoder().decode(SpecDescriptor.self, from: data)
        let pathParser = PathParser(tokenMap: [
            "{subfolder}": "",
            "{subfolders}": "",
            "api": ""
        ])
        let schemaParser = SchemaParser()
        let specParser = MoyaSpecParser(pathParser: pathParser, schemaParser: schemaParser)
        let spec = MoyaSpec(specParser: specParser, descriptor: specDescriptor)

        try MoyaGenerator(generatedPath: self.generatedPath()).generate(from: spec)
    }
}

extension GenerateCommand {
    private func specPath() throws -> String {
        let path: Path
        if Path(self.specPathParameter.value).isAbsolute {
            path = Path(components: [self.specPathParameter.value])
        } else {
            path = Path(components: [self.binaryRoot, self.specPathParameter.value])
        }

        guard path.exists else {
            throw SwiftCodegenError.invalidSwaggerSpecPath(path.string)
        }
        return path.string
    }

    private func generatedPath() -> String {
        let root = (self.binaryRoot + "/")
        guard let value = self.generatedPathParameter.value else { return root }

        let path: Path
        if Path(value).isAbsolute {
            path = Path(components: [value])
        } else {
            path = Path(components: [self.binaryRoot, value])
        }

        return path.exists ? path.string : root
    }
}
