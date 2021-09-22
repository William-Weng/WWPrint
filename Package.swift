// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWPrint",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(name: "WWPrint", targets: ["WWPrint"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "WWPrint", dependencies: []),
        .testTarget(name: "WWPrintTests", dependencies: ["WWPrint"]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
