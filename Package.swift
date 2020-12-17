// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "KeychainStored",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9),
        .macOS(.v10_10),
        .watchOS(.v2)
    ],
    products: [
        .library(
            name: "KeychainStored",
            targets: ["KeychainStored"]),
    ],
    targets: [
        .target(
            name: "KeychainStored",
            dependencies: []),
        .testTarget(
            name: "KeychainStoredTests",
            dependencies: ["KeychainStored"]
        ),
    ]
)
