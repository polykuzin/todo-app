// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreCoordinator",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CoreCoordinator",
            type: .dynamic,
            targets: ["CoreCoordinator"]),
    ],
    targets: [
        .target(
            name: "CoreCoordinator",
            dependencies: []),
        .testTarget(
            name: "CoreCoordinatorTests",
            dependencies: ["CoreCoordinator"]),
    ]
)
