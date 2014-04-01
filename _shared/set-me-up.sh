#!/bin/sh

# http://www.marcusoft.net/2014/03/setting-up-complete-node-development.html

### Set up dependencies
# Configure sources & repos
sudo apt-get update -y
sudo apt-get install libexpat1-dev libicu-dev git build-essential curl software-properties-common python-software-properties -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
sudo sh -c 'echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee /etc/apt/sources.list.d/mongodb.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update -y

echo "** Prerequisites set **\n**Installing sublimetext**"

# sublime-text
sudo apt-get install sublime-text -y

echo "** sublimetext installed **\n**Next up: mongodb**"

# mongo-db
sudo apt-get install mongodb-10gen -y

echo "** mongo installed **\n**Next up: ubuntu-desktop**"

# The biggie - desktop
sudo apt-get install ubuntu-desktop -y
# need to set up a non-vagrant user

echo "** desktop installed **\nNext up: nodejs**"

### Install Node from source - the right way!
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

echo "** Node installed **\n**Next up: nodemon**"

# other node goodies
sudo npm install nodemon 
echo "** nodemon installed **\nNext up: mocha**"

sudo npm install mocha
echo "** mocha installed **\nNext up: user creation!**"

# add a user
sudo adduser developer

echo "** user created **"

## shutdown message (need to start from VBox now we have a desktop env)
read -p "**** All good - now quitting. Run *vagrant halt* then restart from VBox to go to desktop ****"
sudo shutdown 0
