import PathKit
import Stencil

public final class MoyaGenerator {

    private let libRoot = Path(#file).parent().parent().string + "/"
    private let generatedPath: Path

    private lazy var targetWritingPath = self.generatedPath.string + "Targets.Generated.swift"
    private lazy var definitionsWritingPath = self.generatedPath.string + "Definitions.Generated.swift"
    private lazy var repositoriesWritingPath = self.generatedPath.string + "Repositories.Generated.swift"
    private lazy var templatePath = self.libRoot + "Templates"

    private let targetTemplate = "Targets.stencil"
    private let definitionsTemplate = "Definitions.stencil"
    private let repositoriesTemplate = "Repositories.stencil"

    public init(generatedPath: String) {
        self.generatedPath = Path(generatedPath)
    }

    public func generate(from spec: MoyaSpec) throws {

        let loader = FileSystemLoader(paths: [Path(self.templatePath)])
        let environment = Environment(loader: loader, extensions: [])

        let targets = try environment.renderTemplate(name: self.targetTemplate, context: ["targets": spec.targets])
        try targets.write(toFile: self.targetWritingPath, atomically: true, encoding: .utf8)

        let definitions = try environment.renderTemplate(name: self.definitionsTemplate, context: ["definitions": spec.definitions])
        try definitions.write(toFile: definitionsWritingPath, atomically: true, encoding: .utf8)

        let repositories = try environment.renderTemplate(name: self.repositoriesTemplate, context: ["repositories": spec.repositories])
        try repositories.write(toFile: repositoriesWritingPath, atomically: true, encoding: .utf8)
    }
}
