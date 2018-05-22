import Foundation
import RxSwift
import Moya

public protocol RequestProviderType {

    func request<Model: Decodable>(_ target: BaseTargetType) -> Single<Model>
    func request(_ target: BaseTargetType) -> Single<Response>
}
