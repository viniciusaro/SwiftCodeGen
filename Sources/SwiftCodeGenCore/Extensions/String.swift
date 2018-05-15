import Foundation

extension String {

    // turns {countryCode} into \(self.parameters.path.countryCode)
    func replacingWildcardStringsWithStringReference(_ reference: String) -> String {
        if self.first == "{" && self.last == "}" {
            return self.replacingOccurrences(of: "{", with: "\\(\(reference)")
                .replacingOccurrences(of: "}", with: ")")
        }
        return self
    }

    func removingWildcardStrings() -> String {
        if self.first == "{" && self.last == "}" {
            return self.replacingOccurrences(of: "{", with: "")
                .replacingOccurrences(of: "}", with: "")
        }
        return self
    }

    var uncapitalizedFirst: String {
        guard let firstChar = self.first else {
            return self
        }
        let first = String(firstChar).lowercased()
        return first + String(self.dropFirst())
    }

    var capitalizedFirst: String {
        guard let firstChar = self.first else {
            return self
        }
        let first = String(firstChar).uppercased()
        return first + String(self.dropFirst())
    }

    func mergingSubstringsSeparatedBy(_ separator: String, mergingPolicy: MergingPolicy) -> String {
        return self.components(separatedBy: separator)
            .enumerated()
            .map { mergingPolicy.transform($0.element, index: $0.offset) }
            .joined()
    }
}

extension String {
    enum MergingPolicy {
        case byCapitalizingSplits

        func transform(_ word: String, index: Int) -> String {
            switch self {
            case .byCapitalizingSplits:
                if index == 0 { return word }
                return word.capitalizedFirst
            }
        }
    }
}
