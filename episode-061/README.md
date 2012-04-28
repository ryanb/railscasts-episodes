# RailsCasts Episode #61: Sending Email (revised)

http://railscasts.com/episodes/61-sending-email-revised

Requires Ruby 1.9.2 or higher.

### Commands used in this episode

```
rails g mailer user_mailer signup_confirmation
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
