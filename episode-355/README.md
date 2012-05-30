# RailsCasts Episode #355: Hacking with Arel (pro)

http://railscasts.com/episodes/355-hacking-with-arel

Requires Ruby 1.9.2 or higher.


### Commands used in rails console

```
t = Product.arel_table
t[:price].lt(10)
Product.where(_)
Product.where(t[:name].matches("%catan%"))
Product.where(stock: 2).arel.class
Product.where(stock: 2).arel.constraints
_.first.or(Product.where(id: 1).arel.constraints.first)
Product.where(_)
Product.where(stock: 1) | Product.where(id: 1)
Product.where(id: 1..5) - Product.where(id: 2)
Product.match(stock: {lt: 3})
Product.match(stock: [nil, {lt: 3}])
Product.search("catan")
```
