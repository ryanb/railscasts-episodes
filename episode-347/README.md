# RailsCasts Episode #347: Rubber and Amazon EC2

http://railscasts.com/episodes/347-rubber-and-amazon-ec2

Requires Ruby 1.9.2 or higher.

### Commands used in this episode

```
rails new blog -d postgresql
cd blog
rails g scaffold article name content:text
gem install rubber
rubber -h
rbenv rehash
rubber vulcanize complete_passenger_postgresql
mkdir ~/.ec2
mv ~/Downloads/gsg-keypair.pem ~/.ec2/gsg-keypair
chmod 600 ~/.ec2/gsg-keypair
ssh-keygen -y -f ~/.ec2/gsg-keypair > ~/.ec2/gsg-keypair.pub
bundle
cap rubber:create_staging
cat /etc/hosts
cap rubber:destroy_all
cap rubber:create # db01 db:primary=true
ALIAS=app01 ROLES=app cap rubber:create
ALIAS=web01 ROLES=web cap rubber:create
cap rubber:bootstrap
cap deploy:cold
cap rubber:tail_logs
cap deploy
cap -T rubber
cap rubber:describe
ALIAS=app02 ROLES=app cap rubber:create
ALIAS=db02 ROLES=db cap rubber:create
ALIAS=tools ROLES=web_tools cap rubber:create
cap rubber:bootstrap
FILTER=app02 cap deploy:cold
cap deploy
```
