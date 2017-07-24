# Dependencies
express = require 'express'
app = express()
http = (require 'http').Server app
io = (require 'socket.io') http
browserify = require 'browserify-middleware'
stylus = require 'stylus'

# Config
app.set 'view engine', 'pug'
app.use '/js/', browserify __dirname + "/lib/js",
  transform: [["babelify", {presets: ["es2015"]}]]
app.use '/css', stylus.middleware
  src: __dirname + '/lib/styl'
app.use '/css', express.static __dirname + '/lib/styl'
app.get '/bundle/jquery.js', browserify ['jquery']


# Requests
app.get '/edit/:name', (req, res) ->
  res.render 'edit',
    name: req.params.name

# socket.io
io.on 'connection', (socket) ->
  console.log "df"
  socket.on 'draw', (data) ->
    console.log data
    io.emit('draw', data)

# Server start
http.listen 8080
