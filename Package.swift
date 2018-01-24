// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Commands",
    products: [
        .library(name: "Commands", targets: ["Commands"]),
        .library(name: "CommandsCore", targets: ["CommandsCore"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Commands",
            dependencies: ["CommandsCore"]),
        .testTarget(
            name: "CommandsTests",
            dependencies: ["Commands"]),
        .target(
            name: "CommandsCore",
            dependencies: []),
        .testTarget(
             name: "CommandsCoreTests",
             dependencies: ["CommandsCore"])
    ]
)
