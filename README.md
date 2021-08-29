
# 🦅 swift-web-page-perfect

<p align="left">
  <img src="https://img.shields.io/badge/Swift_Version-5.1-orange.svg?style=flat&logo=Swift" alt="Swift Version: 5.1"/>
  <a href="https://swift.org/package-manager">
    <img src="https://img.shields.io/badge/SwiftPM-Compatible-darkgreen.svg?style=flat" alt="Swift Package Manager"/>
  </a>
    <img src="https://img.shields.io/badge/Platforms-macOS,%20iOS,%20Linux-darkgreen.svg?style=flat" alt="Swift Package Manager"/>
</p>

[Perfect](https://www.perfect.org) plugin for type-safe HTML/CSS views using [Swep](https://github.com/alja7dali/swift-web-page).

## Motivation

The most popular choice for rendering HTML/CSS in a Perfect web app is to use the Mustache templating language, but it exposes your application to **runtime errors** and **invalid HTML/CSS**. Our plugin prevents these runtime issues at compile-time by embedding HTML/CSS directly into Swift’s powerful type system. It uses the [Swep](https://github.com/alja7dali/swift-web-page) DSL for constructing HTML/CSS documents using plain Swift data structures.

## Usage

To use the plugin all you have to do is return a `Document` or `Stylesheet` value from your router callback:

``` swift
import Swep
import PerfectHTTP
import PerfectHTTPServer
import SwepPerfectSupport

let router = Router()

router.add(method: .get, uri: "/") { request, response in
  response.append(
    document {
      head {
        style {
          selector("*") {
            margin(.px(5))
            backgroundColor(.hex(0xd1d1d1))
          }
        }
        link()
          .rel(.stylesheet)
          .href("style.min.css")
      }
      body {
        h1("Hello, type-safe HTML/CSS on Perfect!")
          .color(.green)
      }
    }
  )
  response.completed()
}

router.add(method: .get, uri: "style.min.css") { request, response in
  response.append(
    stylesheet {
      selector("body") {
        padding(.rem(0.5))
        lineHeight(1.35)
        fontFamily("SanFranciscoDisplay-Regular")
      }
      selector("h1") {
        marginTop(.rem(2))
        marginBottom(.px(0))
      }
    }
  )
  response.completed()
}

let server = try HTTPServer.launch(name: "localhost", port: 8080, routes: routes)

defer { server.terminate() }
```

## Take it for a spin

We've included a sample Perfect application in this repo to show off its usage. To run the app immediately, simply do:

* `swift run SwepPerfectSupportExample`
* Open your browser to `http://localhost:8080`

The HTML/CSS for that page is constructed and rendered with Swep!!

## Installation

### Swift Package Manager (SPM)

If you want to use *swift-web-page-perfect* in a project that uses [SPM](https://swift.org/package-manager/), it's as simple as adding a `dependencies` clause to your `Package.swift`:

``` swift
dependencies: [
  .package(url: "https://github.com/alja7dali/swift-web-page-perfect.git", from: "0.0.1")
]
```

From there you can add `SwepPerfectSupport` as target dependencies.

``` swift
let SwepPerfectSupport: Target.Dependency = .product(name: "SwepPerfectSupport", package: "swift-web-page-perfect")
...
targets: [
  .taradd(method: .get, uri: name: "yourProject", dependencies: [SwepPerfectSupport]),
]
```

## License

All modules are released under the MIT license. See [LICENSE](./LICENSE.md) for details.