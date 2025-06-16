// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "PlaygroundDependencies",
    products: [
        .library(
            name: "PlaygroundDependencies",
            targets: ["PlaygroundDependencies"]
        )
    ],
    targets: [
        .target(
            name: "PlaygroundDependencies"
        ),
        .testTarget(
            name: "PlaygroundDependenciesTests",
            dependencies: ["PlaygroundDependencies"]
        ),
    ]
)

package.dependencies = [
    .package(url: "https://github.com/ReactiveX/RxSwift", from: "6.9.0")
]
package.targets = [
    .target(
        name: "PlaygroundDependencies",
        dependencies: [
            .product(name: "RxSwift", package: "RxSwift"),
            .product(name: "RxCocoa", package: "RxSwift"),
        ]
    )
]
package.platforms = [
    .iOS("12.0"),
    .macOS("10.13"),
    .tvOS("12.0"),
    .watchOS("4.0"),
]
