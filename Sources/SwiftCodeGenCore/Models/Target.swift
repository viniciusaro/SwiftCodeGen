struct Target {
    let baseURL: String
    let name: String
    let summary: String?
    let description: String?
    let method: String
    let path: String
    let repositoryName: String
    let bodyParameters: [Parameter]
    let pathParameters: [Parameter]
    let queryParameters: [Parameter]
    let hasParameters: Bool
    let returnType: String?
    let hasReturnType: Bool
}
