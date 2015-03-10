express = require("express")
http = require('http')
# https = require('https')
# fs = require('fs')
path = require("path")
# favicon = require("serve-favicon")
logger = require("morgan")
cookieParser = require("cookie-parser")
bodyParser = require("body-parser")
debug = require("debug")("react-express-template")
require("babel/register")

dist = path.join(__dirname, '/../dist')
app = express()
# enable if you have a favicon
# app.use favicon("#{dist}/favicon.ico")
app.use logger("dev")
app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: true)
app.use cookieParser()
app.use express.static(dist)

app.set "port", process.env.PORT or 3000

#
# CORS support
#
# app.all '*', (req, res, next) ->
#   res.header("Access-Control-Allow-Origin", "*")
#   res.header("Access-Control-Allow-Headers", "X-Requested-With")
#   next()

## catch 404 and forwarding to error handler
app.use (req, res, next) ->
  err = new Error("Not Found")
  err.status = 404
  next err

## error handlers

# development error handler
# will print stacktrace
if app.get("env") is "development"
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.send(message: err.message, status: err.status, stack: err.stack)

# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status err.status or 500
  res.send(message: err.message)

#
# HTTPS support
#
# options = key: fs.readFileSync('key.pem'), cert: fs.readFileSync('cert.pem')
# httpsServer = https.createServer(options, app)
# httpsServer.listen app.get("port"), ->
#   debug "Express https server listening on port " + httpsServer.address().port

server = http.createServer(app)
server.listen app.get("port"), ->
  debug "Express server listening on port " + server.address().port
