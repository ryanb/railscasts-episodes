# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
  username: "ryanb",
  full_name: "Ryan Bates",
  twitter_name: "rbates",
  avatar_image_name: "ryan.png",
  url: "http://railscasts.com/",
  bio: <<-BIO
I produce [RailsCasts](http://railscasts.com) - Ruby on Rails Screencasts. I also work on the following projects.

* [CanCan](http://github.com/cancan)
* [Nifty Generators](http://github.com/nifty-generators)
* [Go vs Go](http://govsgo.com/)

Be sure to check out my [GitHub page](https://github.com/ryanb) for more projects.
BIO
)

User.create(username: "MrMystery")
