// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWPrint",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "WWPrint", targets: ["WWPrint"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "WWPrint", dependencies: []),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
