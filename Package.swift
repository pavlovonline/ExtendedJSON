// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExtendedJSON",
    products: [
        .library(
            name: "ExtendedJSON",
            targets: ["ExtendedJSON"]),
    ],
    dependencies: [
//         .package(url: "https://github.com/OpenKitten/BSON.git", .upToNextMajor(from: "6.0.0")),
    ],
    targets: [
        .target(
            name: "ExtendedJSON",
            dependencies: []),
        .testTarget(
            name: "ExtendedJSONTests",
            dependencies: ["ExtendedJSON"]),
    ]
)
