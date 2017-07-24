const $ = require("jquery")
class editor {
  constructor(el, call = function(){}, x = 32, y = 32, s = 16) {
    var c = document.createElement('canvas')
    c.width = x * s
    c.height = y * s
    this.c = c
    el.style.width = c.width + "px"
    el.style.heighy = c.height + "px"
    this.drawcall = call
    this.x = x
    var bgc = document.createElement("canvas")
    bgc.width = s * 2
    bgc.height = s * 2
    var btx = bgc.getContext("2d")
    btx.fillStyle = "#eee"
    btx.fillRect(0,0,s,s)
    btx.fillRect(s,s,s,s)
    c.style.backgroundImage = "url(" + bgc.toDataURL() + ")"
    this.y = y
    this.colour = "#000"
    this.ctx = c.getContext('2d')
    var ctx = this.ctx
    this.s = s
    c.innerHTML = `Your browser is horribly out of date. See below for more info<pre>${navigator.userAgent}</pre>`
    c.addEventListener('mousedown', (e) => {
      this.pen = true
      this.draw(Math.floor((e.clientX - this.c.offsetLeft + $(document).scrollLeft()) / this.s), Math.floor((e.clientY - this.c.offsetTop + $(document).scrollTop()) / this.s), this.colour)
      this.drawcall(Math.floor((e.clientX - this.c.offsetLeft + $(document).scrollLeft()) / this.s), Math.floor((e.clientY - this.c.offsetTop + $(document).scrollTop()) / this.s), this.colour)
    })
    document.addEventListener('mouseup', () => {
      this.pen = false
    })
    c.addEventListener('mousemove', (e) => {
      if(this.pen) {
        this.draw(Math.floor((e.clientX - this.c.offsetLeft + $(document).scrollLeft()) / this.s), Math.floor((e.clientY - this.c.offsetTop + $(document).scrollTop()) / this.s), this.colour)
        this.drawcall(Math.floor((e.clientX - this.c.offsetLeft + $(document).scrollLeft()) / this.s), Math.floor((e.clientY - this.c.offsetTop + $(document).scrollTop()) / this.s), this.colour)
      }

    })
    this.c = c
    el.appendChild(c)
  }
  draw(x, y, colour) {
    var dx = Math.floor(x) * this.s
    var dy = Math.floor(y) * this.s
    var ctx = this.ctx
    if(colour == "transparent") {
      ctx.clearRect(dx, dy, this.s, this.s)
    } else {
      ctx.fillStyle = colour;
      ctx.fillRect(dx, dy, this.s, this.s)
    }
  }
  setColour(c) {
    this.colour = c
  }
}

module.exports = editor
