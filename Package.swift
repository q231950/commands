// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Commands",
    dependencies: [],
    targets: [
        .target(
            name: "Commands",
            dependencies: ["CommandsCore"]),
        .target(
            name: "CommandsCore",
            dependencies: []),
        .testTarget(
             name: "CommandsCoreTests",
             dependencies: ["CommandsCore"])
    ]
)
