// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Masala",
    products: [
        .library(name: "Masala", targets: ["Masala"]),
        .library(name: "MasalaDynamic", type: .dynamic, targets: ["Masala"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Masala", dependencies: []),
        .testTarget(name: "MasalaTests", dependencies: ["Masala"]),
    ]
)
