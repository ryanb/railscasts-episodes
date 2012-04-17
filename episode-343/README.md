# RailsCasts Episode #343: Full-Text Search in PostgreSQL

http://railscasts.com/episodes/343-full-text-search-in-postgresql

Requires Ruby 1.9.2 or higher.

### Commands used in this episode

```
rails db
rails g migration add_unaccent_extension
rake db:migrate
rails g migration add_search_index_to_articles
rm db/schema.rb
rake db:structure:dump
rake db:structure:load
```


### Commands used in database console

```
select 'ninja turtles' @@ 'turtles';
select 'ninja turtles' @@ 'turtle';
select 'ninja turtles' @@ 'green';
select to_tsvector('ninja turtles') @@ plainto_tsquery('turtle');
select to_tsvector('english', 'ninja turtles') @@ plainto_tsquery('english', 'turtle');
select to_tsvector('simple', 'ninja turtles') @@ plainto_tsquery('simple', 'turtle');
select to_tsvector('simple', 'ninja turtles') @@ plainto_tsquery('simple', 'turtles');
select to_tsvector('simple', 'ninja turtles') @@ to_tsquery('simple', 'turtles');
select to_tsvector('simple', 'ninja turtles') @@ to_tsquery('simple', 'ninja turtles');
select to_tsvector('simple', 'ninja turtles') @@ to_tsquery('simple', 'ninja & turtles');
select to_tsvector('simple', 'ninja turtles') @@ to_tsquery('simple', 'ninja | turtles');
select to_tsvector('simple', 'ninja turtles') @@ to_tsquery('simple', 'ninja & !turtles');
select ts_rank(to_tsvector('ninjaturtles'), to_tsquery('turtles'));
```
