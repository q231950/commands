// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Commands",
    products: [
        .executable(name: "CommandsExample", targets: ["CommandsExample"]),
        .library(name: "Commands", targets: ["Commands"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CommandsExample",
            dependencies: ["Commands"]),
        .target(
            name: "Commands",
            dependencies: []),
        .testTarget(
             name: "CommandsTests",
             dependencies: ["Commands"],
             exclude: ["Fixtures/Script.sh"])
    ]
)
