// swift-tools-version: 5.9
import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "Swift+",
    platforms: [.macOS(.v12), .iOS(.v14), .tvOS(.v14), .watchOS(.v6), .macCatalyst(.v14)],
    products: [
        .library(
            name: "SwiftPlus",
            targets: ["SwiftPlus"]
        ),
        .library(
            name: "StringPlus",
            targets: ["StringPlus"]),
        .library(
            name: "NumberPlus",
            targets: ["NumberPlus"]),
        .library(
            name: "ManipulationPlus",
            targets: ["ManipulationPlus"]),
        .library(
            name: "MacrosPlus",
            targets: ["MacrosPlus"]
        ),
        .library(
            name: "TooFar",
            targets: ["TooFar"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax", from: "509.0.0")
    ],
    targets: [
        .target(
            name: "SwiftPlus",
            dependencies: [
                "StringPlus",
                "NumberPlus",
                "ManipulationPlus",
                "MacrosPlus"
            ]
        ),
        .target(
            name: "StringPlus"
        ),
        .target(
            name: "NumberPlus"
        ),
        .target(
            name: "ManipulationPlus"
        ),
        .target(
            name: "TooFar",
            dependencies: []
        ),
        .target(
            name: "MacrosPlus",
            dependencies: ["SwiftPlusMacros"]
        ),
        .macro(
            name: "SwiftPlusMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .testTarget(
            name: "SwiftPlusTests",
            dependencies: ["SwiftPlus","TooFar", .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax")]),

    ]
)
