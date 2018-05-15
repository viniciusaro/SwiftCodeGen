// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SwiftCodeGen",
    products: [
        .executable(
            name: "swiftcodegen",
            targets: ["SwiftCodeGen"]),
        .library(name: "SwiftCodeGenCore",
                 targets: ["SwiftCodeGenCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "11.0.2")),
        .package(url: "https://github.com/kylef/Stencil.git", .upToNextMajor(from: "0.11.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "4.1.2")),
        .package(url: "https://github.com/jakeheis/SwiftCLI.git", from: "5.0.0"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "0.9.1"),
    ],
    targets: [
        .target(
            name: "SwiftCodeGen",
            dependencies: ["SwiftCodeGenCore", "SwiftCLI"]),
        .target(
            name: "SwiftCodeGenCore",
            dependencies: ["Stencil", "PathKit"]),
        .testTarget(
            name: "SwiftCodeGenTests",
            dependencies: ["SwiftCodeGenCore"]),
        .target(
            name: "SwiftCodeGenExample",
            dependencies: ["Moya", "RxSwift", "RxMoya"]),
    ]
)
