import Foundation

struct Category: Codable {

    let id: Int?
    let name: String?
}

struct ApiResponse: Codable {

    let type: String?
    let code: Int?
    let message: String?
}

struct Tag: Codable {

    let id: Int?
    let name: String?
}

struct Order: Codable {

    let status: String?
    let quantity: Int?
    let shipDate: String?
    let id: Int?
    let complete: Bool?
    let petId: Int?
}

struct User: Codable {

    let email: String?
    let id: Int?
    let password: String?
    let phone: String?
    let lastName: String?
    let firstName: String?
    let username: String?
    let userStatus: Int?
}

struct Pet: Codable {

    let status: String?
    let name: String
    let photoUrls: [String]
    let id: Int?
    let tags: [Tag]?
    let category: Category?
}
