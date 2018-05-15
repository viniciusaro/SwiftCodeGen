public final class SchemaParser {

    public init() {}
    
    func typeFrom(parameterDescriptor: ParameterDescriptor) -> String {
        switch parameterDescriptor.type {
        case .raw(let rawType):
            return self.cleanedUpTypeFrom(rawType: rawType, rawFormat: parameterDescriptor.format)
        case .schema(let schema):
            return self.typeFrom(schema: schema)
        }
    }

    func typeFrom(propertyDescriptor: PropertyDescriptor) -> String {
        switch propertyDescriptor.type {
        case .raw(let rawType, _):
            return self.cleanedUpTypeFrom(rawType: rawType, rawFormat: propertyDescriptor.format)
        case .reference(let reference):
            return self.cleanedUpReferenceType(from: reference)
        case .array(type: let arrayType):
            return "[\(self.cleanedUpTypeFrom(rawType: arrayType, rawFormat: propertyDescriptor.format))]"
        case .referenceArray(type: let arrayType):
            return "[\(self.cleanedUpReferenceType(from: arrayType))]"
        }
    }

    func typeFrom(schema: SchemaDescriptor) -> String {
        switch schema {
        case .raw(let rawType, let additional):
            if let additional = additional {
                return self.typeFrom(schema: additional.type)
            }
            return self.cleanedUpTypeFrom(rawType: rawType, rawFormat: nil)
        case .reference(let reference):
            return self.cleanedUpReferenceType(from: reference)
        case .array(type: let arrayType):
            return "[\(self.cleanedUpTypeFrom(rawType: arrayType, rawFormat: nil))]"
        case .referenceArray(type: let arrayType):
            return "[\(self.cleanedUpReferenceType(from: arrayType))]"
        }
    }

    func cleanedUpReferenceType(from referenceType: String) -> String {
        return referenceType.replacingOccurrences(of: "#/definitions/", with: "")
            .components(separatedBy: ".")
            .subarrayAfterSeparatatorIfPresent("DTO")
            .joined()
            .replacingOccurrences(of: "[", with: "")
            .replacingOccurrences(of: "]", with: "")
            .replacingOccurrences(of: ".", with: "")
    }

    private func cleanedUpTypeFrom(rawType: String?, rawFormat: String?) -> String {
        switch (rawType, rawFormat) {
        case ("integer", _):
            return "Int"
        case (_, "float"):
            return "Float"
        case (_, "double"):
            return "Double"
        case ("string", _):
            return "String"
        case ("string", "date"):
            return "Date"
        case ("string", "date-time"):
            return "Date"
        case ("boolean", _):
            return "Bool"
        default:
            return "String"
        }
    }
}
