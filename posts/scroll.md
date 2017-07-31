---
title: Styling Scrollbars with CSS
by: Geordie Fischer
date: 18 July 2017
---
Have you noticed the scrollbars? Probably not, because scrollbars aren't something that people stare at taking in every detail ;). Anyway, if there's a long code block, these are the scrollbars you'll see.
```stylus
::-webkit-scrollbar
    width 0.5rem
    height 0.5rem

::-webkit-scrollbar-corner
    background none

::-webkit-scrollbar-track
    background darken($bg, 10%)
    border-radius 0.25rem

::-webkit-scrollbar-thumb
    border-radius 0.25rem
    background darken($bg, 30%)

::-webkit-scrollbar-thumb:hover
    border-radius 0.25rem
    background darken($bg, 40%)

::-webkit-scrollbar-thumb:active
    border-radius 0.25rem
    background darken($bg, 50%)
```
Just a note, this _wont_ work on non-webkit browsers. I'm leaving it like this because

1. Scrollbars are UI chrome, it doesn't matter if they don't look perfect
2. Most browsers _do support this_, in that they use webkit or one of its derivatives.
3. Apart from using a library such as iScroll, I can't think of any way to do this in non-webkit browsers.
