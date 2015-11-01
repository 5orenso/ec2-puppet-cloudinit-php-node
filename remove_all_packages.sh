#!/bin/bash

# Remove all files.
sudo service Zu-CMS stop
sudo service varnish stop
sudo service apache2 stop

sudo rm -rf /srv/
sudo mv /etc/puppet.orig/ /etc/puppet/

sudo rm -f /etc/init/Zu-CMS.conf
sudo rm -f /etc/logrotate.d/Zu-CMS
sudo rm -f /var/log/upstart/Zu-CMS.log

sudo rm -f /etc/apache2/
sudo rm -f /etc/varnish/
sudo rm -f /etc/default/apache2
sudo rm -f /etc/default/varnish*

sudo rm -rf /var/log/Zu-CMS/
sudo rm -rf /var/run/Zu-CMS/

sudo rm -f /etc/init/FFE-CMS.conf
sudo rm -f /etc/logrotate.d/FFE-CMS
sudo rm -f /var/log/upstart/FFE-CMS.log

sudo rm -rf /var/log/FFE-CMS/
sudo rm -rf /var/run/FFE-CMS/

sudo rm -rf /var/www/lib/
sudo rm -rf /var/www/dev.zu.no/
sudo rm -rf /var/www/dealer.flyfisheurope.com/
sudo rm -rf /var/www/www.flyfisheurope.com/

pear uninstall Mail
pecl uninstall mongo


sudo apt-get remove --purge nodejs
sudo apt-get remove --purge unzip
sudo apt-get remove --purge zip
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

# Check all files.
sudo ps aux | grep node && sudo ls -al /srv/ /etc/init/Zu-CMS.conf /etc/logrotate.d/Zu-CMS /var/log/Zu-CMS/ /etc/puppet/ /var/run/Zu-CMS/

# Run user_data.sh
# sudo bash ~/user_data.sh
