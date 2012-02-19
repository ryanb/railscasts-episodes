# RailsCasts Episode #90: Fragment Caching (revised)

http://railscasts.com/episodes/90-fragment-caching-revised

Require Ruby 1.9.2 or higher to run examples.

Commands used in rails console

```ruby
article = Article.first
article.cache_key
article.touch
Rails.cache.read("views/recent_articles")
Rails.cache.class
```
