let installation = {
  return div {
    h2("Take it for a spin")
    p("""
    We've included a sample Perfect application in this repo to show off its usage. To run the app
    immediately, simply do:
    """)
    ul {
      li(code("swift run SwepPerfectSupportExample"))
      li {
        text("Open your browser to ")
        code("http://localhost:8080")
      }
    }
    p("The HTML/CSS for that page is constructed and rendered with Swep!")
  }
}