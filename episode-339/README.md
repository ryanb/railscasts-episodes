# RailsCasts Episode #339: Chef Solo Basics

http://railscasts.com/episodes/339-chef-solo-basics

Requires Ruby 1.9.2 or higher.

### Commands used on local machine

```
ssh root@72.14.183.209
scp -r root@72.14.183.209:/var/chef .
mate chef
rsync -r . root@72.14.183.209:/var/chef
ssh root@72.14.183.209 "chef-solo -c /var/chef/solo.rb"
brew install ssh-copy-id
ssh-copy-id root@72.14.183.209
openssl passwd -1 "theplaintextpassword"
ssh deployer@72.14.183.209
```

### Commands used on server

```
curl -L https://gist.github.com/raw/2307959/ff2d251c9f4f149c5ca73c873ad8990711b3ca74/chef_solo_bootstrap.sh | bash
ruby -v
chef-solo -v
mkdir /var/chef
cd /var/chef
mkdir -p cookbooks/main/recipes
vim cookbooks/main/recipes/default.rb
vim solo.rb
chef-solo -c solo.rb
vim node.json
chef-solo -c solo.rb -j node.json
```
