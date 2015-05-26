#!/bin/sh
set -e -x

# Get needed software
apt-get --yes --quiet update
apt-get --yes --quiet install git puppet-common

# Fetch puppet configuration from public git repository.
mv /etc/puppet /etc/puppet.orig
git clone https://github.com/5orenso/ec2-puppet-cloudinit-php-node.git /etc/puppet

# Run puppet.
APP="simple-blog"
export FACTER_gitconfigrepo="https://<username>:<password>@github.com/<username>/<config repo>.git"
export FACTER_gitrepo="https://github.com/<username>/$APP.git"
export FACTER_appname="$APP"
export FACTER_appconfig="$APP/litt.no"
puppet apply /etc/puppet/manifests/mainrun.pp
