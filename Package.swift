// swift-tools-version: 5.7

///
import PackageDescription

///
let package = Package(
    name: "VerboseEquatable-module",
    products: [
        .library(
            name: "VerboseEquatable-module",
            targets: ["VerboseEquatable-module"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/jeremyabannister/ProperValueType-module",
            from: "0.1.1"
        ),
        .package(
            url: "https://github.com/jeremyabannister/subscript-collection-safely",
            from: "0.1.0"
        ),
    ],
    targets: [
        .target(
            name: "VerboseEquatable-module",
            dependencies: [
                "ProperValueType-module",
                "subscript-collection-safely",
            ]
        ),
        .testTarget(
            name: "VerboseEquatable-tests",
            dependencies: [
                "VerboseEquatable-module",
                .product(
                    name: "ProperValueTypeTestToolkit",
                    package: "ProperValueType-module"
                ),
            ]
        ),
    ]
)
