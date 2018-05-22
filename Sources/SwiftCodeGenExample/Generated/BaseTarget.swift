import Foundation
import Moya

public protocol BaseTargetType {

    var path: String { get }
    var method: Moya.Method { get }
    var sampleData: Data { get }
    var task: Task { get }
    var validationType: ValidationType { get }
    var headers: [String: String]? { get }
}

public extension BaseTargetType {

    public var sampleData: Data {
        return Data()
    }
    public var validationType: ValidationType {
        return .none
    }
    public var headers: [String: String]? {
        return nil
    }
}

public struct ApiConfiguration {

    let baseURL: URL
}

public final class BaseMultitarget: Moya.TargetType {

    private let targetType: BaseTargetType
    private let apiConfiguration: ApiConfiguration

    init(targetType: BaseTargetType, apiConfiguration: ApiConfiguration) {
        self.targetType = targetType
        self.apiConfiguration = apiConfiguration
    }

    public var baseURL: URL {
        return self.apiConfiguration.baseURL
    }

    public var path: String {
        return self.targetType.path
    }

    public var method: Moya.Method {
        return self.targetType.method
    }

    public var sampleData: Data {
        return self.targetType.sampleData
    }

    public var task: Task {
        return self.targetType.task
    }

    public var headers: [String: String]? {
        return [:]
    }
}
