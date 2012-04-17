# RailsCasts Episode #342: Migrating to PostgreSQL

http://railscasts.com/episodes/342-migrating-to-postgresql

Requires Ruby 1.9.2 or higher.

### Commands used in this episode

```
psql --version
brew install postgresql
initdb /usr/local/var/postgres
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
which psql
rails new blog -d postgresql
rake db:create:all
rails g scaffold article name content:text
rake db:migrate
psql blog_development
rails db
gem install taps
taps
taps server sqlite://db/development.sqlite3 rbates secret
taps pull postgres://rbates@localhost/store_development http://rbates:secret@localhost:5000
```

### Commands used in database console

```
select * from articles;
\d
\d articles
\?
\h
\h select
\q
```
