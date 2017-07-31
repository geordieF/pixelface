# Dependencies
express = require 'express'
app = express()
http = (require 'http').Server app
fs = require 'fs'
io = (require 'socket.io') http
browserify = require 'browserify-middleware'
md5 = require 'md5'
stylus = require 'stylus'
fm = require 'front-matter'
hljs = require 'highlight.js'
Remarkable = require 'remarkable'
md = new Remarkable
  highlight: (str, lang) ->
    if lang and hljs.getLanguage(lang)
      try
        return hljs.highlight(lang, str).value
      catch err
    try
      return hljs.highlightAuto(str).value
    catch err
md.use require 'remarkable-emoji'
# Config
months = ["January", "February", "Arpil", "May", "June", "July", "August", "September", "October", "November", "December"]
app.set 'view engine', 'pug'
app.use '/js/', browserify __dirname + "/lib/js",
  transform: [["babelify", {presets: ["es2015"]}]]
app.use '/css', stylus.middleware
  src: __dirname + '/lib/styl'
app.use '/css', express.static __dirname + '/lib/styl'
app.use '/css/hljs', express.static __dirname + '/node_modules/highlight.js/styles'
app.get '/bundle/jquery.js', browserify ['jquery']


# Requests
app.get '/edit/:name', (req, res) ->
  res.render 'edit',
    name: req.params.name

app.get '/blog/post/:name', (req, res) ->
  fs.readFile __dirname + '/posts/' + req.params.name + '.md', 'utf8', (err, data) ->
    if err
      res.send "cannot GET " + req.url, 404
    else
      nd = fm data
      date = new Date(nd.attributes.date)
      res.render 'blog',
        home: true
        data: [
          name: nd.attributes.title
          id: req.params.name
          by: nd.attributes.by
          date: "#{date.getDate()} #{months[date.getMonth() - 1]} #{date.getFullYear()}"
          content: md.render nd.body
        ]



app.get '/map', (req, res) ->
  res.render 'sitemap'

app.get '/new', (req, res) ->
  res.redirect "/edit/#{md5 Date.now()}"

app.get '/', (req,res) ->
  res.render 'home'

app.get '/blog', (req, res) ->
  posts = []
  fs.readdir __dirname + "/posts", (err, ls) ->
    i = 0
    while i < ls.length
      fs.readFile __dirname + "/posts/" + ls[i], 'utf8', (err, data) ->
        nd = fm data
        na = ls[i]
        date = new Date(nd.attributes.date)
        posts.push {
          name: nd.attributes.title
          by: nd.attributes.by
          date: "#{date.getDate()} #{months[date.getMonth() - 1]} #{date.getFullYear()}"
          content: md.render nd.body
        } unless nd.attributes.hidden
        if posts.length == ls.length
          posts = posts.sort (a, b) ->
            (new Date b.date) - (new Date a.date)
          res.render 'blog',
            data: posts
      i++
# socket.io
io.on 'connection', (socket) ->
  console.log "df"
  socket.on 'draw', (data) ->
    console.log data
    io.emit('draw', data)



# Server start
http.listen 80
