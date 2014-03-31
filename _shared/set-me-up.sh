#!/bin/sh

# http://www.marcusoft.net/2014/03/setting-up-complete-node-development.html

# Configure sources & repos
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
sudo sh -c 'echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee /etc/apt/sources.list.d/mongodb.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update -y

# Install build prerequisites
sudo apt-get install libexpat1-dev libicu-dev git build-essential curl -y

# chrome
sudo apt-get install google-chrome-stable -y

# sublimetext
sudo apt-get install sublime-text -y

# Install Node from source - the right way!
# http://www.joyent.com/blog/installing-node-and-npm
# https://gist.github.com/isaacs/579814

echo 'export "PATH=/home/vagrant/local/bin:$PATH"' >> ~/.bashrc
. ~/.bashrc
mkdir ~/local
mkdir ~/node-latest-install
cd ~/node-latest-install
curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
./configure --prefix=~/local
make install

# others
sudo npm install nodemon 
sudo npm install mocha

# mongo-db
sudo apt-get install mongodb-10gen

# The biggie - desktop
sudo apt-get install ubuntu-desktop -y
# need to set up a non-vagrant user