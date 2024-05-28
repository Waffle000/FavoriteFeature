// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavoriteFeature",
    platforms: [
        .iOS(.v17), .macOS(.v14)
    ],
    products: [
        .library(
            name: "FavoriteFeature",
            targets: ["FavoriteFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Waffle000/DetailFeature.git", branch: "main")
    ],
    targets: [
        .target(
            name: "FavoriteFeature",
            dependencies: ["DetailFeature"]),
        .testTarget(
            name: "FavoriteFeatureTests",
            dependencies: ["FavoriteFeature"]),
    ]
)
