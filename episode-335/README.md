# RailsCasts Episode #335: Deploying to a VPS

http://railscasts.com/episodes/335-deploying-to-a-vps

Requires Ruby 1.9.2 or higher.

## Local Commands

```
rails new blog -d postgresql
rails g scaffold article name content:text

# setup server (below) with "ssh root@72.14.183.209"

# setup Git
mate .gitignore
cp config/database.yml config/database.example.yml
git init
git add .
git commit -m "initial commit"
git remote add origin git@github.com:ryanb/blog.git
git push

# add Capistrano, Unicorn, and nginx config
bundle
capify .
chmod +x config/unicorn_init.sh
git add .
git commit -m "deployment configs"

# ssh setup
cat ~/.ssh/id_rsa.pub | ssh deployer@72.14.183.209 'cat >>
ssh-add # -K on Mac OS X

# deployment
cap deploy:setup
# edit /home/deployer/apps/blog/shared/config/database.yml on server
cap deploy:cold
```

## Server Commands

```
apt-get -y update
apt-get -y install curl git-core python-software-properties

# nginx
add-apt-repository ppa:nginx/stable
apt-get -y update
apt-get -y install nginx
service nginx start

# PostgreSQL
add-apt-repository ppa:pitti/postgresql
apt-get -y update
apt-get -y install postgresql libpq-dev
sudo -u postgres psql
# \password
# create user blog with password 'secret';
# create database blog_production owner blog;
# \q

# Postfix
apt-get -y install telnet postfix

# Node.js
add-apt-repository ppa:chris-lea/node.js
apt-get -y update
apt-get -y install nodejs

# Add deployer user
adduser deployer --ingroup admin
su deployer
cd

# Ruby with rbenv
curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
vim .bashrc # add rbenv to the top
. .bashrc
rbenv bootstrap-ubuntu-10-04
rbenv install 1.9.3-p125
rbenv global 1.9.3-p125
gem install bundler --no-ri --no-rdoc
rbenv rehash

# Get to know github.com
ssh git@github.com

# After deploy:cold
sudo rm /etc/nginx/sites-enabled/default
sudo service nginx restart
sudo /usr/sbin/update-rc.d -f unicorn_blog defaults
```

## Alternate Server Commands

```
# Apache (instead of nginx)
apt-get -y install apache2
a2enmod rewrite
# after deploy:
sudo a2dissite default
sudo a2ensite blog
sudo /etc/init.d/apache2 reload

# MySQL (instead of PostgreSQL)
apt-get -y install mysql-server mysql-client
mysql -u root -p
# create database blog_production;
# grant all on blog_production.* to blog@localhost identified by 'secret';
# exit

# Compile Ruby (instead of rbenv)
sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline5-dev libyaml-dev
wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz
tar -xvzf ruby-1.9.3-p125.tar.gz
cd ruby-1.9.3-p125/
./configure --prefix=/usr/local
make
sudo make install
sudo gem install bundler --no-ri --no-rdoc

# Phusion Passenger (instead of Unicorn)
sudo apt-get -y install libcurl4-openssl-dev apache2-prefork-dev libapr1-dev libaprutil1-dev
sudo gem install passenger --no-ri --no-rdoc
sudo passenger-install-apache2-module
sudo vim /etc/apache2/apache2.conf # modify as instructed by installer
```
