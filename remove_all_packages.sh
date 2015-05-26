#!/bin/bash

# Remove all files.
sudo service simple-blog stop

sudo apt-get remove --purge nodejs
sudo apt-get remove --purge unzip
sudo apt-get remove --purge puppet
sudo apt-get remove --purge php5
sudo apt-get remove --purge php5-curl
sudo apt-get remove --purge php5-dev
sudo apt-get remove --purge php5-cli
sudo apt-get remove --purge php-pear
sudo apt-get remove --purge php5-imagick
sudo apt-get remove --purge php5-gd
sudo apt-get remove --purge varnish
sudo apt-get remove --purge apache2

sudo rm -rf /srv/
sudo mv /etc/puppet.orig/ /etc/puppet/

sudo rm -f /etc/init/simple-blog.conf
sudo rm -f /etc/logrotate.d/simple-blog
sudo rm -f /var/log/upstart/simple-blog.log

sudo rm -rf /var/log/simple-blog/
sudo rm -rf /var/run/simple-blog/

# Check all files.
sudo ps aux | grep node && sudo ls -al /srv/ /etc/init/simple-blog.conf /etc/logrotate.d/simple-blog /var/log/simple-blog/ /etc/puppet/ /var/run/simple-blog/

# Run user_data.sh
# sudo bash ~/user_data.sh
