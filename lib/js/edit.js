const editor = require('./editor');
const $ = require("jquery");
const socket = require('socket.io-client')();
const editbox = $("#editor")[0];

function drawcall(x, y, c) {
  socket.emit('draw', JSON.stringify({
    x: x,
    y: y,
    c: c,
    for: window.file
  }))
}


// init editor
const e = new editor(editbox, drawcall, 128, 64, 7);


$("#black").on('click', function(){
  e.setColour("#000")
})
$("#blue").on('click', function(){
  e.setColour("#00f")
})
$("#red").on('click', function(){
  e.setColour("#f00")
})
$("#green").on('click', function(){
  e.setColour("green")
})
$("#orange").on('click', function(){
  e.setColour("orange")
})
$("#yellow").on('click', function(){
  e.setColour("yellow")
})
$("#clear").on('click', function(){
  e.setColour("transparent")
})
// socket.io
socket.on('draw', function(data) {
  data = JSON.parse(data)
  if(data.for == window.file){
    e.draw(
      data.x,
      data.y,
      data.c
    )
}
})
