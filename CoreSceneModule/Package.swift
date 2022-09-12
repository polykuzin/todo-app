// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreSceneModule",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CoreSceneModule",
            targets: ["CoreSceneModule"]),
    ],
    dependencies: [
        .package(path: "Core"),
        .package(path: "CoreAnalytics"),
        .package(path: "CoreCoordinator")
    ],
    targets: [
        .target(
            name: "CoreSceneModule",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "CoreAnalytics", package: "CoreAnalytics"),
                .product(name: "CoreCoordinator", package: "CoreCoordinator"),
            ]
        ),
        .testTarget(
            name: "CoreSceneModuleTests",
            dependencies: ["CoreSceneModule"]),
    ]
)
