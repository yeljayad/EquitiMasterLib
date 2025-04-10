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
            targets: ["EquitiMasterLib", "LeanSDKWrapper"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "EquitiMasterLib", 
            url: "https://firebasestorage.googleapis.com/v0/b/cips-dev-b82d8.appspot.com/o/payment-sdk%2Fios%2Fmaster%2Fmaster.xcframework.zip?alt=media&token=081c7eb5-5e16-4006-a396-0d0e2e811af1", 
            checksum: "db48022350da1f80fd1e33dc91d2795818e73b153ce57df3f380476b9fba8011"
        ),
        .binaryTarget(
            name: "LeanSDK", 
            url: "https://cdn.leantech.me/link/sdk/ios/build.15/LeanSDK.xcframework-build.15.zip", 
            checksum: "e1c34b01bf5d5a9210654ea849f15607c451e585b78ce3fc21fbe8712f3f3d92"
        ),
        .target(
            name: "LeanSDKWrapper",
            dependencies: ["LeanSDK"],
            path: "Sources/LeanSDKWrapper"
        )
    ]
)