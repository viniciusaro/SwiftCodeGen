import Foundation
import Moya
import RxMoya
import RxSwift


protocol StoreRepositoryType {
    

    func postStoreOrder(headers: [String: String]?, parameters: PostStoreOrderTarget.Parameters) -> Single<Order>


    func getStoreInventory(headers: [String: String]?) -> Single<Int>


    func deleteStoreOrderByOrderId(headers: [String: String]?, parameters: DeleteStoreOrderByOrderIdTarget.Parameters) -> Completable


    func getStoreOrderByOrderId(headers: [String: String]?, parameters: GetStoreOrderByOrderIdTarget.Parameters) -> Single<Order>

}

protocol PetRepositoryType {
    

    func deletePetByPetId(headers: [String: String]?, parameters: DeletePetByPetIdTarget.Parameters) -> Completable


    func getPetByPetId(headers: [String: String]?, parameters: GetPetByPetIdTarget.Parameters) -> Single<Pet>


    func postPetByPetId(headers: [String: String]?, parameters: PostPetByPetIdTarget.Parameters) -> Completable


    func getPetFindByStatus(headers: [String: String]?, parameters: GetPetFindByStatusTarget.Parameters) -> Single<[Pet]>


    func postPetUploadImageByPetId(headers: [String: String]?, parameters: PostPetUploadImageByPetIdTarget.Parameters) -> Single<ApiResponse>


    func getPetFindByTags(headers: [String: String]?, parameters: GetPetFindByTagsTarget.Parameters) -> Single<[Pet]>


    func putPet(headers: [String: String]?, parameters: PutPetTarget.Parameters) -> Completable


    func postPet(headers: [String: String]?, parameters: PostPetTarget.Parameters) -> Completable

}

protocol UserRepositoryType {
    

    func deleteUserByUsername(headers: [String: String]?, parameters: DeleteUserByUsernameTarget.Parameters) -> Completable


    func putUserByUsername(headers: [String: String]?, parameters: PutUserByUsernameTarget.Parameters) -> Completable


    func getUserByUsername(headers: [String: String]?, parameters: GetUserByUsernameTarget.Parameters) -> Single<User>


    func postUserCreateWithArray(headers: [String: String]?, parameters: PostUserCreateWithArrayTarget.Parameters) -> Completable


    func postUser(headers: [String: String]?, parameters: PostUserTarget.Parameters) -> Completable


    func getUserLogout(headers: [String: String]?) -> Completable


    func postUserCreateWithList(headers: [String: String]?, parameters: PostUserCreateWithListTarget.Parameters) -> Completable


    func getUserLogin(headers: [String: String]?, parameters: GetUserLoginTarget.Parameters) -> Single<String>

}



final class StoreRepository: StoreRepositoryType {

    private let provider: MoyaProvider<MultiTarget>

    init(provider: MoyaProvider<MultiTarget>) {
        self.provider = provider
    }
    

    /**
    Place an order for a pet
    */
    func postStoreOrder(headers: [String: String]?, parameters: PostStoreOrderTarget.Parameters) -> Single<Order> {
        return self.provider
            .rx.request(.init(PostStoreOrderTarget(headers: headers, parameters: parameters)))
            .map(Order.self)
    }


    /**
    Returns pet inventories by status
    */
    func getStoreInventory(headers: [String: String]?) -> Single<Int> {
        return self.provider
            .rx.request(.init(GetStoreInventoryTarget(headers: headers)))
            .map(Int.self)
    }


    /**
    Delete purchase order by ID
    */
    func deleteStoreOrderByOrderId(headers: [String: String]?, parameters: DeleteStoreOrderByOrderIdTarget.Parameters) -> Completable {
        return self.provider
            .rx.request(.init(DeleteStoreOrderByOrderIdTarget(headers: headers, parameters: parameters)))
            .asObservable()
            .ignoreElements()
    }


    /**
    Find purchase order by ID
    */
    func getStoreOrderByOrderId(headers: [String: String]?, parameters: GetStoreOrderByOrderIdTarget.Parameters) -> Single<Order> {
        return self.provider
            .rx.request(.init(GetStoreOrderByOrderIdTarget(headers: headers, parameters: parameters)))
            .map(Order.self)
    }

}

final class PetRepository: PetRepositoryType {

    private let provider: MoyaProvider<MultiTarget>

    init(provider: MoyaProvider<MultiTarget>) {
        self.provider = provider
    }
    

    /**
    Deletes a pet
    */
    func deletePetByPetId(headers: [String: String]?, parameters: DeletePetByPetIdTarget.Parameters) -> Completable {
        return self.provider
            .rx.request(.init(DeletePetByPetIdTarget(headers: headers, parameters: parameters)))
            .asObservable()
            .ignoreElements()
    }


    /**
    Find pet by ID
    */
    func getPetByPetId(headers: [String: String]?, parameters: GetPetByPetIdTarget.Parameters) -> Single<Pet> {
        return self.provider
            .rx.request(.init(GetPetByPetIdTarget(headers: headers, parameters: parameters)))
            .map(Pet.self)
    }


    /**
    Updates a pet in the store with form data
    */
    func postPetByPetId(headers: [String: String]?, parameters: PostPetByPetIdTarget.Parameters) -> Completable {
        return self.provider
            .rx.request(.init(PostPetByPetIdTarget(headers: headers, parameters: parameters)))
            .asObservable()
            .ignoreElements()
    }


    /**
    Finds Pets by status
    */
    func getPetFindByStatus(headers: [String: String]?, parameters: GetPetFindByStatusTarget.Parameters) -> Single<[Pet]> {
        return self.provider
            .rx.request(.init(GetPetFindByStatusTarget(headers: headers, parameters: parameters)))
            .map([Pet].self)
    }


    /**
    uploads an image
    */
    func postPetUploadImageByPetId(headers: [String: String]?, parameters: PostPetUploadImageByPetIdTarget.Parameters) -> Single<ApiResponse> {
        return self.provider
            .rx.request(.init(PostPetUploadImageByPetIdTarget(headers: headers, parameters: parameters)))
            .map(ApiResponse.self)
    }


    /**
    Finds Pets by tags
    */
    func getPetFindByTags(headers: [String: String]?, parameters: GetPetFindByTagsTarget.Parameters) -> Single<[Pet]> {
        return self.provider
            .rx.request(.init(GetPetFindByTagsTarget(headers: headers, parameters: parameters)))
            .map([Pet].self)
    }


    /**
    Update an existing pet
    */
    func putPet(headers: [String: String]?, parameters: PutPetTarget.Parameters) -> Completable {
        return self.provider
            .rx.request(.init(PutPetTarget(headers: headers, parameters: parameters)))
            .asObservable()
            .ignoreElements()
    }


    /**
    Add a new pet to the store
    */
    func postPet(headers: [String: String]?, parameters: PostPetTarget.Parameters) -> Completable {
        return self.provider
            .rx.request(.init(PostPetTarget(headers: headers, parameters: parameters)))
            .asObservable()
            .ignoreElements()
    }

}

final class UserRepository: UserRepositoryType {

    private let provider: MoyaProvider<MultiTarget>

    init(provider: MoyaProvider<MultiTarget>) {
        self.provider = provider
    }
    

    /**
    Delete user
    */
    func deleteUserByUsername(headers: [String: String]?, parameters: DeleteUserByUsernameTarget.Parameters) -> Completable {
        return self.provider
            .rx.request(.init(DeleteUserByUsernameTarget(headers: headers, parameters: parameters)))
            .asObservable()
            .ignoreElements()
    }


    /**
    Updated user
    */
    func putUserByUsername(headers: [String: String]?, parameters: PutUserByUsernameTarget.Parameters) -> Completable {
        return self.provider
            .rx.request(.init(PutUserByUsernameTarget(headers: headers, parameters: parameters)))
            .asObservable()
            .ignoreElements()
    }


    /**
    Get user by user name
    */
    func getUserByUsername(headers: [String: String]?, parameters: GetUserByUsernameTarget.Parameters) -> Single<User> {
        return self.provider
            .rx.request(.init(GetUserByUsernameTarget(headers: headers, parameters: parameters)))
            .map(User.self)
    }


    /**
    Creates list of users with given input array
    */
    func postUserCreateWithArray(headers: [String: String]?, parameters: PostUserCreateWithArrayTarget.Parameters) -> Completable {
        return self.provider
            .rx.request(.init(PostUserCreateWithArrayTarget(headers: headers, parameters: parameters)))
            .asObservable()
            .ignoreElements()
    }


    /**
    Create user
    */
    func postUser(headers: [String: String]?, parameters: PostUserTarget.Parameters) -> Completable {
        return self.provider
            .rx.request(.init(PostUserTarget(headers: headers, parameters: parameters)))
            .asObservable()
            .ignoreElements()
    }


    /**
    Logs out current logged in user session
    */
    func getUserLogout(headers: [String: String]?) -> Completable {
        return self.provider
            .rx.request(.init(GetUserLogoutTarget(headers: headers)))
            .asObservable()
            .ignoreElements()
    }


    /**
    Creates list of users with given input array
    */
    func postUserCreateWithList(headers: [String: String]?, parameters: PostUserCreateWithListTarget.Parameters) -> Completable {
        return self.provider
            .rx.request(.init(PostUserCreateWithListTarget(headers: headers, parameters: parameters)))
            .asObservable()
            .ignoreElements()
    }


    /**
    Logs user into the system
    */
    func getUserLogin(headers: [String: String]?, parameters: GetUserLoginTarget.Parameters) -> Single<String> {
        return self.provider
            .rx.request(.init(GetUserLoginTarget(headers: headers, parameters: parameters)))
            .map(String.self)
    }

}
