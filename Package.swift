// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "Swift+",
    platforms: [ .macOS(.v12), .iOS(.v13), .watchOS(.v8), .visionOS(.v1), .tvOS(.v13) ],
    products: [
        .library(
            name: "SwiftPlus",
            targets: ["SwiftPlus"]),
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
            name: "CollectionPlus",
            targets: ["CollectionPlus"]),
        .library(
            name: "TooFar",
            targets: ["TooFar"]),
    ],
    targets: [
        .target(
            name: "SwiftPlus",
            dependencies: ["StringPlus",
                           "NumberPlus",
                           "ManipulationPlus",
                           "CollectionPlus"]
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
            name: "CollectionPlus"
        ),
        .target(
            name: "TooFar",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftPlusTests",
            dependencies: ["SwiftPlus","TooFar"]),

    ]
)
