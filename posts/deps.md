---
title: What are all these dependencies?
by: Geordie Fischer
date: 20 July 2017
---
If, for some reason you decide to manually install the dependencies, you'll probably be shocked by the sheer amount.

None of these aren't used and I can do the same things without them, I just find it a much nicer experience using these.

Here's the list of top-level dependencies, and what they do.

```javascript
{
  'dependencies': {
    'babel-preset-es2015': '^6.24.1', // These two are for internet explorer support
    'babelify': '^7.3.0',
    'browserify': '^14.4.0',          // Browserify is what handles the require statements
    'browserify-middleware': '^7.1.0',
    'express': '^4.15.3',             // express handles actual server requests
    'remarkable': '^1.7.1',           // Remakable renders the markdown, highlight.js does syntax highlighting. Both of these are for this blog.
    'remarkable-emoji': '^0.1.3',
    'highlight.js': '^9.12.0',
    'md5': '^2.2.1',                  // MD5 is an hashing algorithm, I use it as a hacky way to generate file names.
    'jquery': '^3.2.1',               // jQuery is a library for interacting with HTML
    'socket.io': '^2.0.3',            // socket.io handles realtime interaction with other clients
    'stylus': '^0.54.5'               // Stylus makes writing CSS so much nicer
    'pug': '^2.0.0-rc.2',             // Pug allows me to make templates instad of static code.
  }
}
```

Those are the top-level dependencies. The reason that npm installs so many is that these dependencies have dependencies and so on. I could never have a use for so many, but apparently some people do. Or it's the butterfly effect. It's probably the butterfly effect.
