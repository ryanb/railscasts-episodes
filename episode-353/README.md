# RailsCasts Episode #353: OAuth with Doorkeeper (pro)

http://railscasts.com/episodes/353-oauth-with-doorkeeper

Requires Ruby 1.9.2 or higher.


### Commands used in this episode

```
rails g doorkeeper:install
rake db:migrate
gem install oauth2
irb -r oauth2
```

### Commands used in irb

```
callback = "http://localhost:3001/auth/todo/callback"
app_id = "70b18783971c5405907241c1b45616a26c704dd6406cf1c6743ab61c4615eb00"
secret = "1dbd541132ca2bdeb9fe83b41d24490b2be445c30fd1856e5914f6d343c4a71b"
client = OAuth2::Client.new(app_id, secret, site: "http://localhost:3000/")
client.auth_code.authorize_url(redirect_uri: callback)
access = client.auth_code.get_token('b77df49142317a6a42ea12412d2065c949c9e01ca3c9d72a478f34f153a88678', redirect_uri: callback)
access.get("/api/tasks").parsed
access.post("/api/tasks", params: {task: {name: "test oauth"}})
access.get("/api/user").parsed
```
