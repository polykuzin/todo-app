// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Module_Inbox",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Module_Inbox",
            type: .dynamic,
            targets: ["Module_Inbox"]),
    ],
    dependencies: [
        .package(path: "CoreCoordinator")
    ],
    targets: [
        .target(
            name: "Module_Inbox",
            dependencies: [
                .product(name: "CoreCoordinator", package: "CoreCoordinator")
            ]
        ),
        .testTarget(
            name: "Module_InboxTests",
            dependencies: ["Module_Inbox"]),
    ]
)
