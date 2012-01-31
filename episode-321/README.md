# RailsCasts Episode #321: HTTP Caching

http://railscasts.com/episodes/321-http-caching

Requires Ruby 1.9.2 or higher.

### Commands used in episode

```
curl -I http://localhost:3000/
curl -I http://localhost:3000/ -c cookies.txt
curl -I http://localhost:3000/ -b cookies.txt
curl -I http://localhost:3000/ -b cookies.txt --header 'If-None-Match: "8c90bb6e63dc2868f076c82a939f6654"'
curl -I http://localhost:3000/products/1
curl -I http://localhost:3000/products/1 --header 'If-None-Match: "6b110718516575b1a14131d2c7668af5"'
curl -I http://localhost:3000/products/1 --header 'If-Modified-Since: Sat, 28 Jan 2012 18:25:53 GMT'
```
