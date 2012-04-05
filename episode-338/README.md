# RailsCasts Episode #338: Globalize3

http://railscasts.com/episodes/338-globalize3

Requires Ruby 1.9.2 or higher.


### Commands used in this episode

```
rails g migration create_article_translations
rake db:migrate
rails c
```

### Commands used in rails console

```ruby
I18n.locale
Article.first.name
I18n.locale = :wk
Article.first.update_attribute(:name, "Ahhyya")
I18n.locale = :en
```
