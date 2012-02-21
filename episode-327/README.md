# RailsCasts Episode #327: MiniTest with Rails

http://railscasts.com/episodes/327-minitest-with-rails

Requires Ruby 1.9.2 or higher.

Commands used in episode:

```
rails new store -T
rails g scaffold product name price:decimal released_on:date
rake db:migrate
ruby -Itest test/models/product_test.rb
rake db:test:prepare
rake
rake TESTOPTS='--seed=53594'
```
