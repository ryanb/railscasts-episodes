# RailsCasts Episode #333: Extending Refinery CMS (pro)

http://railscasts.com/episodes/333-extending-refinery-cms

Requires Ruby 1.9.2 or higher.

Commands used in episode:

```
rails g refinery:engine piano name:string dimensions:string manufactured_on:date upright:boolean photo:image description:text
bundle install
rails generate refinery:pianos
rake db:migrate
rake db:seed
rake refinery:override view=refinery/head
rm app/views/refinery/_header.html.erb
```

See db/development.sqlite3.example for a copy of the database.