@_exported import Swep
@_exported import PerfectHTTP
@_exported import PerfectHTTPServer
@_exported import SwepPerfectSupport

var routes = Routes()

routes.add(method: .get, uri: "/") { request, response in
  response.append(layout(title: "Home", content: home))
  response.completed()
}

routes.add(method: .get, uri: "/usage") { request, response in
  response.append(layout(title: "Usage", content: usage))
  response.completed()
}

routes.add(method: .get, uri: "/advanced-usage") { request, response in
  response.append(layout(title: "Advanced Usage", content: advancedUsage))
  response.completed()
}

routes.add(method: .get, uri: "/installation") { request, response in
  response.append(layout(title: "Installation", content: installation))
  response.completed()
}

routes.add(method: .get, uri: "/myStyle.min.css") { request, response in
  response.append(makeStyle().content)
  response.completed()
}

let server = try HTTPServer.launch(name: "localhost", port: 8080, routes: routes)

defer { server.terminate() }
