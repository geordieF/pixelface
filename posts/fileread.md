---
title: Farewell JSON, Hello Directories
date: 1500897545946
by: Geordie Fischer
---
Up until now, this blog has used a JSON file with an array of all the posts. After a bit of work, I can now proudly say that the blog uses a directory of files with YAML front matter. This means I can just save a file in a directory and the server will parse it and add it to the blog!

And, if you're interested, here's an example of the sort of metadata I'd put in.

```YAML
title: It's Christmas
date: 25 December 2017
by: Geordie Fischer
```
Followed by the markdown of the post (I wrote about this earlier [here](/blog/post/meta))
