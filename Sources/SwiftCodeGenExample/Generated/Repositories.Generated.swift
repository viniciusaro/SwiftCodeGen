import Foundation
import Moya
import RxMoya
import RxSwift


protocol StoreRepositoryType {
    

    func postStoreOrder(parameters: PostStoreOrderTarget.Parameters) -> Single<Order>


    func getStoreInventory() -> Single<Int>


    func deleteStoreOrderByOrderId(parameters: DeleteStoreOrderByOrderIdTarget.Parameters) -> Completable


    func getStoreOrderByOrderId(parameters: GetStoreOrderByOrderIdTarget.Parameters) -> Single<Order>

}

protocol PetRepositoryType {
    

    func deletePetByPetId(parameters: DeletePetByPetIdTarget.Parameters) -> Completable


    func getPetByPetId(parameters: GetPetByPetIdTarget.Parameters) -> Single<Pet>


    func postPetByPetId(parameters: PostPetByPetIdTarget.Parameters) -> Completable


    func getPetFindByStatus(parameters: GetPetFindByStatusTarget.Parameters) -> Single<[Pet]>


    func postPetUploadImageByPetId(parameters: PostPetUploadImageByPetIdTarget.Parameters) -> Single<ApiResponse>


    func getPetFindByTags(parameters: GetPetFindByTagsTarget.Parameters) -> Single<[Pet]>


    func putPet(parameters: PutPetTarget.Parameters) -> Completable


    func postPet(parameters: PostPetTarget.Parameters) -> Completable

}

protocol UserRepositoryType {
    

    func deleteUserByUsername(parameters: DeleteUserByUsernameTarget.Parameters) -> Completable


    func putUserByUsername(parameters: PutUserByUsernameTarget.Parameters) -> Completable


    func getUserByUsername(parameters: GetUserByUsernameTarget.Parameters) -> Single<User>


    func postUserCreateWithArray(parameters: PostUserCreateWithArrayTarget.Parameters) -> Completable


    func postUser(parameters: PostUserTarget.Parameters) -> Completable


    func getUserLogout() -> Completable


    func postUserCreateWithList(parameters: PostUserCreateWithListTarget.Parameters) -> Completable


    func getUserLogin(parameters: GetUserLoginTarget.Parameters) -> Single<String>

}



final class StoreRepository: StoreRepositoryType {

    private let provider: RequestProviderType

    init(provider: RequestProviderType) {
        self.provider = provider
    }
    

    /**
    Place an order for a pet
    */
    func postStoreOrder(parameters: PostStoreOrderTarget.Parameters) -> Single<Order> {
        return self.provider
            .request(PostStoreOrderTarget(parameters: parameters))
            .map(Order.self)
    }


    /**
    Returns pet inventories by status
    */
    func getStoreInventory() -> Single<Int> {
        return self.provider
            .request(GetStoreInventoryTarget())
            .map(Int.self)
    }


    /**
    Delete purchase order by ID
    */
    func deleteStoreOrderByOrderId(parameters: DeleteStoreOrderByOrderIdTarget.Parameters) -> Completable {
        return self.provider
            .request(DeleteStoreOrderByOrderIdTarget(parameters: parameters))
            .asObservable()
            .ignoreElements()
    }


    /**
    Find purchase order by ID
    */
    func getStoreOrderByOrderId(parameters: GetStoreOrderByOrderIdTarget.Parameters) -> Single<Order> {
        return self.provider
            .request(GetStoreOrderByOrderIdTarget(parameters: parameters))
            .map(Order.self)
    }

}

final class PetRepository: PetRepositoryType {

    private let provider: RequestProviderType

    init(provider: RequestProviderType) {
        self.provider = provider
    }
    

    /**
    Deletes a pet
    */
    func deletePetByPetId(parameters: DeletePetByPetIdTarget.Parameters) -> Completable {
        return self.provider
            .request(DeletePetByPetIdTarget(parameters: parameters))
            .asObservable()
            .ignoreElements()
    }


    /**
    Find pet by ID
    */
    func getPetByPetId(parameters: GetPetByPetIdTarget.Parameters) -> Single<Pet> {
        return self.provider
            .request(GetPetByPetIdTarget(parameters: parameters))
            .map(Pet.self)
    }


    /**
    Updates a pet in the store with form data
    */
    func postPetByPetId(parameters: PostPetByPetIdTarget.Parameters) -> Completable {
        return self.provider
            .request(PostPetByPetIdTarget(parameters: parameters))
            .asObservable()
            .ignoreElements()
    }


    /**
    Finds Pets by status
    */
    func getPetFindByStatus(parameters: GetPetFindByStatusTarget.Parameters) -> Single<[Pet]> {
        return self.provider
            .request(GetPetFindByStatusTarget(parameters: parameters))
            .map([Pet].self)
    }


    /**
    uploads an image
    */
    func postPetUploadImageByPetId(parameters: PostPetUploadImageByPetIdTarget.Parameters) -> Single<ApiResponse> {
        return self.provider
            .request(PostPetUploadImageByPetIdTarget(parameters: parameters))
            .map(ApiResponse.self)
    }


    /**
    Finds Pets by tags
    */
    func getPetFindByTags(parameters: GetPetFindByTagsTarget.Parameters) -> Single<[Pet]> {
        return self.provider
            .request(GetPetFindByTagsTarget(parameters: parameters))
            .map([Pet].self)
    }


    /**
    Update an existing pet
    */
    func putPet(parameters: PutPetTarget.Parameters) -> Completable {
        return self.provider
            .request(PutPetTarget(parameters: parameters))
            .asObservable()
            .ignoreElements()
    }


    /**
    Add a new pet to the store
    */
    func postPet(parameters: PostPetTarget.Parameters) -> Completable {
        return self.provider
            .request(PostPetTarget(parameters: parameters))
            .asObservable()
            .ignoreElements()
    }

}

final class UserRepository: UserRepositoryType {

    private let provider: RequestProviderType

    init(provider: RequestProviderType) {
        self.provider = provider
    }
    

    /**
    Delete user
    */
    func deleteUserByUsername(parameters: DeleteUserByUsernameTarget.Parameters) -> Completable {
        return self.provider
            .request(DeleteUserByUsernameTarget(parameters: parameters))
            .asObservable()
            .ignoreElements()
    }


    /**
    Updated user
    */
    func putUserByUsername(parameters: PutUserByUsernameTarget.Parameters) -> Completable {
        return self.provider
            .request(PutUserByUsernameTarget(parameters: parameters))
            .asObservable()
            .ignoreElements()
    }


    /**
    Get user by user name
    */
    func getUserByUsername(parameters: GetUserByUsernameTarget.Parameters) -> Single<User> {
        return self.provider
            .request(GetUserByUsernameTarget(parameters: parameters))
            .map(User.self)
    }


    /**
    Creates list of users with given input array
    */
    func postUserCreateWithArray(parameters: PostUserCreateWithArrayTarget.Parameters) -> Completable {
        return self.provider
            .request(PostUserCreateWithArrayTarget(parameters: parameters))
            .asObservable()
            .ignoreElements()
    }


    /**
    Create user
    */
    func postUser(parameters: PostUserTarget.Parameters) -> Completable {
        return self.provider
            .request(PostUserTarget(parameters: parameters))
            .asObservable()
            .ignoreElements()
    }


    /**
    Logs out current logged in user session
    */
    func getUserLogout() -> Completable {
        return self.provider
            .request(GetUserLogoutTarget())
            .asObservable()
            .ignoreElements()
    }


    /**
    Creates list of users with given input array
    */
    func postUserCreateWithList(parameters: PostUserCreateWithListTarget.Parameters) -> Completable {
        return self.provider
            .request(PostUserCreateWithListTarget(parameters: parameters))
            .asObservable()
            .ignoreElements()
    }


    /**
    Logs user into the system
    */
    func getUserLogin(parameters: GetUserLoginTarget.Parameters) -> Single<String> {
        return self.provider
            .request(GetUserLoginTarget(parameters: parameters))
            .map(String.self)
    }

}
