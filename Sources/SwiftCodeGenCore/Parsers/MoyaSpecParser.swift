public final class MoyaSpecParser {

    private let pathParser: PathParser
    private let schemaParser: SchemaParser

    public init(pathParser: PathParser, schemaParser: SchemaParser) {
        self.pathParser = pathParser
        self.schemaParser = schemaParser
    }

    func targetsFrom(descriptor: SpecDescriptor) -> [Target] {
        var targets: [Target] = []

        for (path, methodDescriptor) in descriptor.paths.values {
            for (method, targetDescriptor) in methodDescriptor.values {

                let baseURL = self.baseURLFrom(descriptor: descriptor)
                let targetName = self.targetNameFrom(path: path, method: method)
                let methodName = self.methodNameFrom(method: method)
                let pathName = self.pathStringFrom(path: path)
                let repositoryName = self.repositoryNameFrom(path: path)
                let summary = self.summaryFrom(targetDescriptor: targetDescriptor)
                let description = self.descriptionFrom(targetDescriptor: targetDescriptor)
                let returnType = self.returnTypeFrom(targetDescriptor: targetDescriptor)
                let bodyParameters = self.bodyParametersFrom(targetDescriptor: targetDescriptor)
                let pathParameters = self.pathParametersFrom(targetDescriptor: targetDescriptor)
                let queryParameters = self.queryParametersFrom(targetDescriptor: targetDescriptor)
                let hasParameters = (targetDescriptor.parameters ?? []).count > 0
                let hasReturnType = returnType != nil

                let target = Target(baseURL: baseURL,
                                    name: targetName,
                                    summary: summary,
                                    description: description,
                                    method: methodName,
                                    path: pathName,
                                    repositoryName: repositoryName,
                                    bodyParameters: bodyParameters,
                                    pathParameters: pathParameters,
                                    queryParameters: queryParameters,
                                    hasParameters: hasParameters,
                                    returnType: returnType,
                                    hasReturnType: hasReturnType)

                targets.append(target)
            }
        }
        return targets
    }

    func repositoriesFrom(descriptor: SpecDescriptor) -> [Repository] {
        return self.targetsFrom(descriptor: descriptor)
            .groupBy { $0.repositoryName }
            .map { (key, targets) in

                let methods = targets.map { target -> RepositoryMethod in

                    let name = target.name.replacingOccurrences(of: "Target", with: "").uncapitalizedFirst
                    let description = target.summary
                    let targetName = target.name
                    let hasParameters = target.hasParameters
                    let returnType = target.returnType
                    let hasReturnType = target.hasReturnType
                    return RepositoryMethod(description: description,
                                            name: name,
                                            targetName: targetName,
                                            returnType: returnType,
                                            hasParameters: hasParameters,
                                            hasReturnType: hasReturnType)
                }

                return Repository(name: key, methods: methods)
            }
    }

    func definitionsFrom(descriptor: SpecDescriptor) -> [Definition] {
        var definitions: [Definition] = []
        for (definition, definitionDescriptor) in descriptor.definitions.values {

            let definitionName = self.schemaParser.cleanedUpReferenceType(from: definition)
            let properties = self.propertiesFrom(definitionDescriptor: definitionDescriptor)
            let definition = Definition(name: definitionName, properties: properties)
            definitions.append(definition)
        }
        return definitions
    }
}

extension MoyaSpecParser {

    private func baseURLFrom(descriptor: SpecDescriptor) -> String {
        return "https://" + descriptor.host + (descriptor.basePath ?? "")
    }
}

extension MoyaSpecParser {

    private func propertiesFrom(definitionDescriptor: DefinitionDesctiptor) -> [Parameter] {
        guard let propertyCollection = definitionDescriptor.properties else { return [] }
        var properties: [Parameter] = []
        for (property, propertyDescriptor) in propertyCollection.values {

            let propertyName = property.uncapitalizedFirst
            let propertyType = self.schemaParser.typeFrom(propertyDescriptor: propertyDescriptor)
            let required = definitionDescriptor.required?.contains(property) ?? false
            let property = Parameter(name: propertyName, type: propertyType, required: required)
            properties.append(property)
        }

        return properties
    }
}

extension MoyaSpecParser {

    private func targetNameFrom(path pathString: String, method: String) -> String {
        return self.pathParser.targetNameFrom(path: pathString, method: method)
    }

    private func pathStringFrom(path: String) -> String {
        return self.pathParser.pathStringFrom(path: path)
    }

    private func methodNameFrom(method: String) -> String {
        return method
    }

    private func repositoryNameFrom(path: String) -> String {
        return self.pathParser.repositoryNameFrom(path: path)
    }

    private func summaryFrom(targetDescriptor: TargetDescriptor) -> String? {
        return targetDescriptor.summary
    }

    private func descriptionFrom(targetDescriptor: TargetDescriptor) -> String? {
        return targetDescriptor.description
    }

    private func returnTypeFrom(targetDescriptor: TargetDescriptor) -> String? {
        for (responseCode, responseDescriptor) in targetDescriptor.responses.values {
            if let schema = responseDescriptor.schema, responseCode == "200" {
                return self.schemaParser.typeFrom(schema: schema)
            }
        }
        return nil
    }

    private func bodyParametersFrom(targetDescriptor: TargetDescriptor) -> [Parameter] {
        return self.parametersFrom(targetDescriptor: targetDescriptor, in: "body")
    }

    private func pathParametersFrom(targetDescriptor: TargetDescriptor) -> [Parameter] {
        return self.parametersFrom(targetDescriptor: targetDescriptor, in: "path")
    }

    private func queryParametersFrom(targetDescriptor: TargetDescriptor) -> [Parameter] {
        return self.parametersFrom(targetDescriptor: targetDescriptor, in: "query")
    }

    private func parametersFrom(targetDescriptor: TargetDescriptor, in type: String) -> [Parameter] {
        let parameters = targetDescriptor.parameters ?? []
        return parameters.filter({ $0.in == type })
            .map { descriptor in
                let type = self.schemaParser.typeFrom(parameterDescriptor: descriptor)
                let parameterName = descriptor.name.mergingSubstringsSeparatedBy(".", mergingPolicy: .byCapitalizingSplits)
                return Parameter(name: parameterName, type: type, required: descriptor.required)
        }
    }
}
