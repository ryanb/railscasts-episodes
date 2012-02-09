# RailsCasts Episode #323: Backbone on Rails Part 1

http://railscasts.com/episodes/323-backbone-on-rails-part-1

Requires Ruby 1.9.2 or higher.

Commands used in episode

  bundle
  rails new raffler
  rails g controller main index --skip-javascripts
  rails g backbone:install
  rails g backbone:scaffold entry
  rails g resource entry name winner:boolean --skip-javascripts
  rake db:migrate
  rake db:seed

JavaScript used in console

  entries = new Raffler.Collections.Entries()
  entries.length
  entries.fetch()
  entry = entries.shuffle()[0]
  entry.get('name')
  entry.set({'winner': true})
  entry.save()
  entries.create({'name': 'Avdi Grimm'})
