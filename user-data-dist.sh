#!/bin/sh
set -e -x

# Get needed software
apt-get --yes --quiet update
apt-get --yes --quiet install git puppet-common

# Fetch puppet configuration from public git repository.
mv /etc/puppet /etc/puppet.orig
git clone https://github.com/5orenso/ec2-puppet-cloudinit-php-node.git /etc/puppet

# Run puppet.
NODEAPP="Zu-CMS"
PHPAPP="FFE-CMS"

export FACTER_gitconfigrepo="https://<username>:<password>@github.com/<username>/<config repo>.git"

export FACTER_node_gitrepo="https://github.com/<username>/$NODEAPP.git"
export FACTER_node_appname="$NODEAPP"
export FACTER_node_appconfig="ffe/$NODEAPP/zu"

export FACTER_php_gitrepo="https://<username>:<password>@github.com/<username>/$PHPAPP.git"
export FACTER_php_appname="$PHPAPP"
export FACTER_php_appconfig="ffe/$PHPAPP"

export FACTER_php_domain_1="dev.zu.no"
export FACTER_php_domain_2="dealer.flyfisheurope.com"
export FACTER_php_domain_3="www.flyfisheurope.com"

export FACTER_apache_config="ffe/apache2"
export FACTER_varnish_config="ffe/varnish"
export FACTER_php_config="ffe/php5"
export FACTER_etc_config="ffe/etc"

puppet apply /etc/puppet/manifests/mainrun.pp
