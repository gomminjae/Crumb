// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Crumb",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Crumb",
            targets: ["Crumb"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Crumb"),
        .testTarget(
            name: "CrumbTests",
            dependencies: ["Crumb"]),
    ]
)
