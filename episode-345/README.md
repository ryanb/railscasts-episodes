# RailsCasts Episode #345: Hstore

http://railscasts.com/episodes/345-hstore

Requires Ruby 1.9.2 or higher.

### Commands used in this episode

```
rails g hstore:setup
rails g migration add_properties_to_products properties:hstore
rails g migration index_products_properties
rake db:migrate
rails c
```

### Commands used in rails console

```
p = Product.first
p.properties = {rating: "PG-13", runtime: 107}
p.save!
p.reload.properties
p.properties.object_id
p.properties["runtime"] = 123
p.properties = { ... }
Product.where("properties -> 'rating' = 'PG-13'")
Product.where("properties -> 'rating' LIKE '%G%'")
Product.where("(properties -> 'runtime')::int > 100")
Product.where("properties @> ('rating' => 'PG-13')")
Product.has_rating("R")
```
