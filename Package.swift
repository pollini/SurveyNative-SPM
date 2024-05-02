// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SurveyNative-SPM",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SurveyNative-SPM",
            targets: ["SurveyNative-SPM"]),
    ],
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SurveyNative-SPM"),
        .testTarget(
            name: "SurveyNative-SPMTests",
            dependencies: ["SurveyNative-SPM"]),
    ]
)
