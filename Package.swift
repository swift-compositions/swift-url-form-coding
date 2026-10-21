// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-url-form-coding",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "URLFormCoding", targets: ["URLFormCoding"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-compositions/swift-html-form-coder.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-standards/swift-html-standard.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "URLFormCoding",
            dependencies: [
                .product(name: "HTML Form Coder", package: "swift-html-form-coder"),
                .product(name: "HTML Form Coder Codable", package: "swift-html-form-coder"),
                .product(name: "HTML Standard", package: "swift-html-standard"),
            ]
        ),
        .testTarget(
            name: "URLFormCoding Tests",
            dependencies: [
                .target(name: "URLFormCoding"),
                .product(name: "HTML Standard", package: "swift-html-standard"),
            ]
        ),
    ]
)

for target in package.targets {
    target.swiftSettings =
        (target.swiftSettings ?? []) + [
            .enableUpcomingFeature("MemberImportVisibility")
        ]
}
