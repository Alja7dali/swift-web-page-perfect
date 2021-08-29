import Swep
import PerfectHTTP

extension HTTPResponse {
  public func append(_ node: Document) {
    self.setHeader(.contentType, value: "text/html; charset=utf-8")
    self.appendBody(string: node.render())
  }

  public func append(_ node: Stylesheet) {
    self.setHeader(.contentType, value: "text/css; charset=utf-8")
    self.appendBody(string: node.render())
  }
}