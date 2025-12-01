// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode2025",
    products: [
        .executable(name: "AdventOfCode2025", targets: ["AdventOfCode2025"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "AdventOfCode2025"
        ),
        .testTarget(
            name: "AdventOfCode2025Tests",
            dependencies: ["AdventOfCode2025"]
        ),
    ],
    
)
