// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EquitiMasterLib",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "EquitiMasterLib",
            targets: ["EquitiMasterLibWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/leantechnologies/link-sdk-ios-distribution", .upToNextMajor(from: "3.0.0"))
    ],
    targets: [
        .binaryTarget(
            name: "EquitiMasterLib", 
            url: "https://firebasestorage.googleapis.com/v0/b/cips-dev-b82d8.appspot.com/o/payment-sdk%2Fios%2Fmaster%2Fmaster.xcframework.zip?alt=media&token=081c7eb5-5e16-4006-a396-0d0e2e811af1",
            checksum: "db48022350da1f80fd1e33dc91d2795818e73b153ce57df3f380476b9fba8011"
        ),
        .target(
            name: "EquitiMasterLibWrapper",
            dependencies: [
                "EquitiMasterLib",
                .product(name: "LinkSDK", package: "link-sdk-ios-distribution")
            ],
            path: "Sources/EquitiMasterLibWrapper"
        )
    ]
)

