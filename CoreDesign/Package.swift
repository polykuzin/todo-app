// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreDesign",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CoreDesign",
            targets: ["CoreDesign"]),
    ],
    targets: [
        .target(
            name: "CoreDesign",
            dependencies: []),
        .testTarget(
            name: "CoreDesignTests",
            dependencies: ["CoreDesign"]),
    ]
)
