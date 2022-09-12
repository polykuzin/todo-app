// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreAnalytics",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "CoreAnalytics", targets: ["CoreAnalytics"])
    ],
    targets: [
        .target(
            name: "CoreAnalytics"
        ),
        .testTarget(
            name: "CoreAnalyticsTests",
            dependencies: [
                "CoreAnalytics"
            ]
        )
    ]
)
