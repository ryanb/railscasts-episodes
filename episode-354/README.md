# RailsCasts Episode #354: Squeel

http://railscasts.com/episodes/354-squeel

Requires Ruby 1.9.2 or higher.


### Commands used in this episode

```
rails c
rails g squeel:initializer
```

### Commands used in rails console

```
Product.where { released_at < 3.months.ago }
Product.where{released_at < 3.months.ago}
Product.where{released_at < 3.months.ago}.class
Product.where{released_at.lt 3.months.ago}
Product.where{released_at.lt(3.months.ago) & price.gt(20)}
Product.where{released_at.lt(3.months.ago) | price.gt(20)}
```
