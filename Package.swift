// swift-tools-version:5.7
// This Swift package requires Swift 5.7 or later.

import PackageDescription

let package = Package(
    name: "EquitiMasterLib",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Defines the public library product.
        .library(
            name: "equitimasterlib",
            targets: ["EquitiMasterLibWrapper"]
        ),
    ],
    dependencies: [
        // Lean Technologies Link SDK
        .package(
            url: "https://github.com/leantechnologies/link-sdk-ios-distribution",
            .upToNextMajor(from: "3.0.0")
        )
    ],
    targets: [
        // Binary target for the prebuilt XCFramework
        .binaryTarget(
            name: "equitimasterlib",
            url: "https://firebasestorage.googleapis.com/v0/b/cips-dev-b82d8.appspot.com/o/payment-sdk%2Fios%2Fmaster%2Fmaster.xcframework.zip?alt=media&token=081c7eb5-5e16-4006-a396-0d0e2e811af1",
            checksum: "db48022350da1f80fd1e33dc91d2795818e73b153ce57df3f380476b9fba8011"
        ),
        // Wrapper target that exposes the functionality
        .target(
            name: "EquitiMasterLibWrapper",
            dependencies: [
                "equitimasterlib",
                .product(name: "LinkSDK", package: "link-sdk-ios-distribution")
            ]
        )
    ]
)
