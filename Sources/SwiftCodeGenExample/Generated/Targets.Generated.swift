import Moya
import Foundation


/**
Summary: Deletes a pet
 */
struct DeletePetByPetIdTarget: BaseTargetType {
    
    var path: String {
        return "/pet/\(self.parameters.path.petId)"
    }
    let method: Moya.Method = .delete
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        
        
        let path: Path

        struct Path: Encodable {

            let petId: Int

            init(petId: Int) {
                
                self.petId = petId
            }
        }
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            
            
            .merging(self.path.asHeaders(), uniquingKeysWith: { (f, s) in f })
        }
    }
    
}

/**
Summary: Find pet by ID
Returns a single pet */
struct GetPetByPetIdTarget: BaseTargetType {
    
    var path: String {
        return "/pet/\(self.parameters.path.petId)"
    }
    let method: Moya.Method = .get
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        
        
        let path: Path

        struct Path: Encodable {

            let petId: Int

            init(petId: Int) {
                
                self.petId = petId
            }
        }
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            
            
            .merging(self.path.asHeaders(), uniquingKeysWith: { (f, s) in f })
        }
    }
    
}

/**
Summary: Updates a pet in the store with form data
 */
struct PostPetByPetIdTarget: BaseTargetType {
    
    var path: String {
        return "/pet/\(self.parameters.path.petId)"
    }
    let method: Moya.Method = .post
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        
        
        let path: Path

        struct Path: Encodable {

            let petId: Int

            init(petId: Int) {
                
                self.petId = petId
            }
        }
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            
            
            .merging(self.path.asHeaders(), uniquingKeysWith: { (f, s) in f })
        }
    }
    
}

/**
Summary: Finds Pets by status
Multiple status values can be provided with comma separated strings */
struct GetPetFindByStatusTarget: BaseTargetType {
    
    var path: String {
        return "/pet/findByStatus"
    }
    let method: Moya.Method = .get
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        
        let query: Query

        struct Query: Encodable {

            let status: String

            init(status: String) {
                
                self.status = status
            }
        }
        
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            
            .merging(self.query.asHeaders(), uniquingKeysWith: { (f, s) in f })
            
        }
    }
    
}

/**
Summary: Delete user
This can only be done by the logged in user. */
struct DeleteUserByUsernameTarget: BaseTargetType {
    
    var path: String {
        return "/user/\(self.parameters.path.username)"
    }
    let method: Moya.Method = .delete
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        
        
        let path: Path

        struct Path: Encodable {

            let username: String

            init(username: String) {
                
                self.username = username
            }
        }
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            
            
            .merging(self.path.asHeaders(), uniquingKeysWith: { (f, s) in f })
        }
    }
    
}

/**
Summary: Updated user
This can only be done by the logged in user. */
struct PutUserByUsernameTarget: BaseTargetType {
    
    var path: String {
        return "/user/\(self.parameters.path.username)"
    }
    let method: Moya.Method = .put
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        let body: Body

        struct Body: Encodable {

            let body: User

            init(body: User) {
                
                self.body = body
            }
        }
        
        let path: Path

        struct Path: Encodable {

            let username: String

            init(username: String) {
                
                self.username = username
            }
        }
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            .merging(self.body.asHeaders(), uniquingKeysWith: { (f, s) in f })
            
            .merging(self.path.asHeaders(), uniquingKeysWith: { (f, s) in f })
        }
    }
    
}

/**
Summary: Get user by user name
 */
struct GetUserByUsernameTarget: BaseTargetType {
    
    var path: String {
        return "/user/\(self.parameters.path.username)"
    }
    let method: Moya.Method = .get
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        
        
        let path: Path

        struct Path: Encodable {

            let username: String

            init(username: String) {
                
                self.username = username
            }
        }
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            
            
            .merging(self.path.asHeaders(), uniquingKeysWith: { (f, s) in f })
        }
    }
    
}

/**
Summary: uploads an image
 */
struct PostPetUploadImageByPetIdTarget: BaseTargetType {
    
    var path: String {
        return "/pet/\(self.parameters.path.petId)/uploadImage"
    }
    let method: Moya.Method = .post
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        
        
        let path: Path

        struct Path: Encodable {

            let petId: Int

            init(petId: Int) {
                
                self.petId = petId
            }
        }
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            
            
            .merging(self.path.asHeaders(), uniquingKeysWith: { (f, s) in f })
        }
    }
    
}

/**
Summary: Finds Pets by tags
Muliple tags can be provided with comma separated strings. Use         tag1, tag2, tag3 for testing. */
struct GetPetFindByTagsTarget: BaseTargetType {
    
    var path: String {
        return "/pet/findByTags"
    }
    let method: Moya.Method = .get
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        
        let query: Query

        struct Query: Encodable {

            let tags: String

            init(tags: String) {
                
                self.tags = tags
            }
        }
        
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            
            .merging(self.query.asHeaders(), uniquingKeysWith: { (f, s) in f })
            
        }
    }
    
}

/**
Summary: Creates list of users with given input array
 */
struct PostUserCreateWithArrayTarget: BaseTargetType {
    
    var path: String {
        return "/user/createWithArray"
    }
    let method: Moya.Method = .post
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        let body: Body

        struct Body: Encodable {

            let body: [User]

            init(body: [User]) {
                
                self.body = body
            }
        }
        
        
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            .merging(self.body.asHeaders(), uniquingKeysWith: { (f, s) in f })
            
            
        }
    }
    
}

/**
Summary: Update an existing pet
 */
struct PutPetTarget: BaseTargetType {
    
    var path: String {
        return "/pet"
    }
    let method: Moya.Method = .put
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        let body: Body

        struct Body: Encodable {

            let body: Pet

            init(body: Pet) {
                
                self.body = body
            }
        }
        
        
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            .merging(self.body.asHeaders(), uniquingKeysWith: { (f, s) in f })
            
            
        }
    }
    
}

/**
Summary: Add a new pet to the store
 */
struct PostPetTarget: BaseTargetType {
    
    var path: String {
        return "/pet"
    }
    let method: Moya.Method = .post
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        let body: Body

        struct Body: Encodable {

            let body: Pet

            init(body: Pet) {
                
                self.body = body
            }
        }
        
        
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            .merging(self.body.asHeaders(), uniquingKeysWith: { (f, s) in f })
            
            
        }
    }
    
}

/**
Summary: Create user
This can only be done by the logged in user. */
struct PostUserTarget: BaseTargetType {
    
    var path: String {
        return "/user"
    }
    let method: Moya.Method = .post
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        let body: Body

        struct Body: Encodable {

            let body: User

            init(body: User) {
                
                self.body = body
            }
        }
        
        
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            .merging(self.body.asHeaders(), uniquingKeysWith: { (f, s) in f })
            
            
        }
    }
    
}

/**
Summary: Logs out current logged in user session
 */
struct GetUserLogoutTarget: BaseTargetType {
    
    var path: String {
        return "/user/logout"
    }
    let method: Moya.Method = .get
    
    let task: Task = .requestPlain
    
}

/**
Summary: Place an order for a pet
 */
struct PostStoreOrderTarget: BaseTargetType {
    
    var path: String {
        return "/store/order"
    }
    let method: Moya.Method = .post
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        let body: Body

        struct Body: Encodable {

            let body: Order

            init(body: Order) {
                
                self.body = body
            }
        }
        
        
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            .merging(self.body.asHeaders(), uniquingKeysWith: { (f, s) in f })
            
            
        }
    }
    
}

/**
Summary: Returns pet inventories by status
Returns a map of status codes to quantities */
struct GetStoreInventoryTarget: BaseTargetType {
    
    var path: String {
        return "/store/inventory"
    }
    let method: Moya.Method = .get
    
    let task: Task = .requestPlain
    
}

/**
Summary: Creates list of users with given input array
 */
struct PostUserCreateWithListTarget: BaseTargetType {
    
    var path: String {
        return "/user/createWithList"
    }
    let method: Moya.Method = .post
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        let body: Body

        struct Body: Encodable {

            let body: [User]

            init(body: [User]) {
                
                self.body = body
            }
        }
        
        
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            .merging(self.body.asHeaders(), uniquingKeysWith: { (f, s) in f })
            
            
        }
    }
    
}

/**
Summary: Logs user into the system
 */
struct GetUserLoginTarget: BaseTargetType {
    
    var path: String {
        return "/user/login"
    }
    let method: Moya.Method = .get
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        
        let query: Query

        struct Query: Encodable {

            let username: String
            let password: String

            init(username: String, password: String) {
                
                self.username = username
                self.password = password
            }
        }
        
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            
            .merging(self.query.asHeaders(), uniquingKeysWith: { (f, s) in f })
            
        }
    }
    
}

/**
Summary: Delete purchase order by ID
For valid response try integer IDs with positive integer value.         Negative or non-integer values will generate API errors */
struct DeleteStoreOrderByOrderIdTarget: BaseTargetType {
    
    var path: String {
        return "/store/order/\(self.parameters.path.orderId)"
    }
    let method: Moya.Method = .delete
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        
        
        let path: Path

        struct Path: Encodable {

            let orderId: Int

            init(orderId: Int) {
                
                self.orderId = orderId
            }
        }
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            
            
            .merging(self.path.asHeaders(), uniquingKeysWith: { (f, s) in f })
        }
    }
    
}

/**
Summary: Find purchase order by ID
For valid response try integer IDs with value >= 1 and <= 10.         Other values will generated exceptions */
struct GetStoreOrderByOrderIdTarget: BaseTargetType {
    
    var path: String {
        return "/store/order/\(self.parameters.path.orderId)"
    }
    let method: Moya.Method = .get
    
    var task: Task {
        return .requestParameters(parameters: self.parameters.asMoyaHeader(), encoding: URLEncoding.default)
    }

    let parameters: Parameters

    struct Parameters: Encodable {
        
        
        let path: Path

        struct Path: Encodable {

            let orderId: Int

            init(orderId: Int) {
                
                self.orderId = orderId
            }
        }
        func asMoyaHeader() -> [String: Any] {
            return [String: Any]()
            
            
            .merging(self.path.asHeaders(), uniquingKeysWith: { (f, s) in f })
        }
    }
    
}


extension Encodable {
    func asHeaders() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
            let json = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else {
            return [:]
        }
        return json
    }
}