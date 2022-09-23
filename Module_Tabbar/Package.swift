// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Module_Tabbar",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Module_Tabbar",
            type: .dynamic,
            targets: ["Module_Tabbar"]),
    ],
    dependencies: [
        .package(path: "./CoreDesign"),
        .package(path: "./CoreCoordinator"),
        .package(path: "./Module_Inbox")
    ],
    targets: [
        .target(
            name: "Module_Tabbar",
            dependencies: [
                .product(name: "CoreDesign", package: "CoreDesign"),
                .product(name: "CoreCoordinator", package: "CoreCoordinator"),
                            
                .product(name: "Module_Inbox", package: "Module_Inbox"),
            ]
        ),
        .testTarget(
            name: "Module_TabbarTests",
            dependencies: ["Module_Tabbar"]),
    ]
)
