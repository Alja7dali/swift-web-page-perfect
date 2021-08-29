let usage = {
  return div {
    h2("Usage")
    p("To use the plugin all you have to do is return a `Document` or `Stylesheet` value from your router callback:")
    pre(#"""
    import Swep
    import PerfectHTTP
    import PerfectHTTPServer
    import SwepPerfectSupport
    
    let router = Router()
    defer { Perfect.stop() }
    
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
    """#)
  }
}