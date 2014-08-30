
express = require("express")
http = require("http")
path = require("path")
routes = require("./routes")
app = express()

root = path.join(__dirname, "../../")

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", path.join(__dirname, "../views")
app.set "view engine", "jade"
app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use express.cookieParser("34ycn278gybvjnxszewufnv40ty9yghvhzpkdoqwjeimox")
app.use express.session()
app.use app.router
app.use require("less-middleware")(path.join(root, "public"))
app.use express.static(path.join(root, "public"))

# development only
app.configure 'development', ->
  app.use express.errorHandler()

app.get "/", routes.index

server = http.createServer(app)

server.listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
