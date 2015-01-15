# installation and configuration script for new servers.
# the stack: nginx with passenger, db: postgresql, backend: ruby on rails

# ask for user input regarding the version of ruby.
echo "Desired version of Ruby for this install: "
read

# update the server
`sudo apt-get update`

########### INSTALL AND CONFIG ALL REQUIRED SOFTWARE ###########

# install nginx and make sure the web server restarts
# on server reboot. should be default.
`sudo apt-get install nginx; sudo update-rc.d nginx defaults`

# install imagemagick and its dependencies
`sudo apt-get install imagemagick libmagickwand-dev`

# install postgres
`sudo apt-get install postgresql postgresql-contrib libpq-dev`

# install ruby
# build from source
`sudo apt-get install build-essential libssl-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev nodejs libsqlite3-dev sqlite3`

# create temporary directory for ruby
`mkdir ~/ruby; cd ~/ruby`

# get the version of ruby we want
`wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-$REPLY.tar.gz`

# decompress and go to the ruby version directory
`tar -xzf ruby-2.1.2.tar.gz; cd ruby-$REPLY;`

# install ruby!
# this take approx. 20 mins
`./configure; make; sudo make install;`

# delete temporary ruby directory
`rm -rf ~/ruby`

# now we need to install phusion passenger
# create a new pgp key
`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7`

# create a new source file and add a new line to it
`sudo echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main >> /etc/apt/sources.list.d/passenger.list`

# change ownership and privileges of that file
`sudo chown root: /etc/apt/sources.list.d/passenger.list; sudo chmod 600 /etc/apt/sources.list.d/passenger.list;`

# update apt cache
`sudo apt-get update`

# install passenger with nginx
`sudo apt-get install nginx-extras passenger`

# the installation of passenger outdated our version of ruby. we need to
# remove what they installed and replace it with what we installed before.
# perhaps I can just move the order of the installation around so that ruby is installed
# after. needs experimentation!
# remove the ruby passenger installed and symlink the version we installed before
`sudo rm /usr/bin/ruby; sudo ln -s /usr/local/bin/ruby /usr/bin/ruby;`

# install bundler
`sudo gem install bundler`

# now get git
`sudo apt-get install git`

# make the directory where we will put the project
`mkdir /home/ubuntu/site/dojob`

# make a new sites-available nginx site file and put a server
# configuration block in it
`echo "server {
  listen 80 default_server;
  server_name www.mydomain.com;
  passenger_enabled on;
  passenger_app_env development;
  root /home/rails/testapp/public;
}" >> /etc/nginx/sites-available/dojob`

# symlink that file to sites enabled
`sudo ln -s /etc/nginx/sites-available/dojob /etc/nginx/sites-enabled/dojob`

# print out the last bit of configuration that needs to be done by the user
echo "\n\n*************\nThere is some minor configuration left for you to do."
echo "Go to the file /etc/nginx/nginx.conf and do the following:"
echo "\t1. uncomment both phusion passenger lines (the line for the ruby path and the passenger path)."
echo "Go to the file /etc/nginx/sites-available/default and do the following:"
echo "\t1. comment out the line that says we are listening on port 80 and the line after it."
echo "Almost done... Press any key to advance"
read
echo "Execute the following command: 'sudo nginx -s reload'"
echo "You should be good to go!"
