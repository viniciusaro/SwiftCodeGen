import PathKit

public final class PathParser {

    public init() {}

    func targetNameFrom(path: String, method: String) -> String {
        let verb = method.capitalizedFirst

        let nonParameters = self.nonParameterComponentsFrom(path: path)
            .map({ $0.capitalizedFirst })
            .reduce("", +)

        let parameters = self.parameterComponentsFrom(path: path)
            .map({ "By" + $0.removingWildcardStrings().capitalizedFirst })
            .reduce("", +)

        return verb + nonParameters + parameters + "Target"
    }

    func pathStringFrom(path pathString: String) -> String {
        return Path(pathString).components
            .filter { $0 != "/" }
            .map { $0.replacingWildcardStringsWithStringReference("self.parameters.path.") }
            .map { "/" + $0 }
            .reduce("", +)
    }

    func repositoryNameFrom(path: String) -> String {
        let mainName = Path(path).components
            .filter { $0 != "/" }
            .first ?? ""

        return mainName.capitalizedFirst + "Repository"
    }
}

extension PathParser {
    private func parameterComponentsFrom(path: String) -> [String] {
        return Path(path).components
            .filter { $0 != "/" }
            .filter { $0.first == "{" && $0.last == "}"  }
            .map { $0.mergingSubstringsSeparatedBy("-", mergingPolicy: .byCapitalizingSplits) }
    }

    private func nonParameterComponentsFrom(path: String) -> [String] {
        return Path(path).components
            .filter { $0 != "/" }
            .filter { $0.first != "{" && $0.last != "}"  }
            .map { $0.mergingSubstringsSeparatedBy("-", mergingPolicy: .byCapitalizingSplits) }
    }
}
