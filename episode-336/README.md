# RailsCasts Episode #336: Copycopter

http://railscasts.com/episodes/336-copycopter

Requires Ruby 1.9.2 or higher.

```
git clone git://github.com/copycopter/copycopter-server.git
cd copycopter-server
heroku create --stack cedar
bundle install --without=test # if heroku command fails
git push heroku master
heroku run rake db:migrate
heroku restart
heroku run rake copycopter:project NAME=Store USERNAME=ryanb PASSWORD=secret
heroku open
```
