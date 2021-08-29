// swift-tools-version:5.3
import PackageDescription

let Swep: Target.Dependency = .product(name: "Swep", package: "swift-web-page")

let package = Package(
  name: "swift-web-page-perfect",
  products: [
    .library(name: "SwepPerfectSupport", targets: ["SwepPerfectSupport"]),
    .executable(name: "SwepPerfectSupportExample", targets: ["SwepPerfectSupportExample"]),
  ],
  dependencies: [
    .package(url: "https://github.com/alja7dali/swift-web-page", from: "0.0.1"),
		.package(name: "PerfectHTTPServer", url: "https://github.com/PerfectlySoft/Perfect-HTTPServer", from: "3.0.0"),
	],
  targets: [
    .target(name: "SwepPerfectSupport", dependencies: [Swep, "PerfectHTTPServer"]),
    .target(name: "SwepPerfectSupportExample", dependencies: [Swep, "PerfectHTTPServer", "SwepPerfectSupport"]),
    .testTarget(name: "SwepPerfectSupportTests", dependencies: ["SwepPerfectSupport"]),
  ],
  swiftLanguageVersions: [
    .version("5"),
  ]
)
