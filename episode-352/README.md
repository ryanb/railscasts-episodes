# RailsCasts Episode #352: Securing an API

http://railscasts.com/episodes/352-securing-an-api

Requires Ruby 1.9.2 or higher.

### Commands used in this episode

```
curl http://localhost:3000/api/products -I
curl http://localhost:3000/api/products -u 'admin:secret'
curl 'http://localhost:3000/api/products?access_token=123' -I
curl http://localhost:3000/api/products -H 'Authorization: Token token="c576f0136149a2e2d9127b3901015545"'
```
