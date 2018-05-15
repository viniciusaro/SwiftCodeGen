# SwiftCodeGen

Swift CLI tools for generating Swift code.

## Swift from Swagger

The `swiftcodegen generate` command generates [Moya](https://github.com/Moya/Moya) targets and combine them into `Repositories` allowing a nice [RxSwift](https://github.com/ReactiveX/RxSwift) interface for making API requests.

It uses Swift's `Codable` capabilities to parse a [Swagger spec](https://editor.swagger.io) in json format. The spec contains all information needed to create models, optional requirements, return types and so on.

[Here](https://github.com/viniciusaro/SwiftCodeGen/tree/master/Sources/SwiftCodeGenExample/Generated) you can find an example of generated code from [Swagger Pet](https://editor.swagger.io) sample
