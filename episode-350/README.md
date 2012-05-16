# RailsCasts Episode #350: REST API Versioning

http://railscasts.com/episodes/350-rest-api-versioning

Requires Ruby 1.9.2 or higher.

### Commands used in this episode

```
rails g migration change_products_released_on
rake db:migrate
cp -R app/controllers/api/v1 app/controllers/api/v2
curl -H 'Accept: application/vnd.example.v1' http://localhost:3000/api/products
```
