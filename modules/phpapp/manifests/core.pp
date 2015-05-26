class phpapp::core {
  notice("I am a php ${::php_appname} and want the software")

#  exec { "phpapp_download_config":
#    command => "git clone ${::gitconfigrepo} /srv/config/",
#    path    => "/usr/local/bin/:/usr/bin/:/bin/",
#    cwd     => "/srv/",
#    require => Class["phpapp::prework"]
#  } ->

  file { "phpapp_ensure_domain_1":
    name   => "/var/www/${::php_domain_1}",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_domain_1":
    name   => "/var/www/${::php_domain_1}/zu",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_domain_2":
    name   => "/var/www/${::php_domain_2}",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_domain_2":
    name   => "/var/www/${::php_domain_2}/zu",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_domain_3":
    name   => "/var/www/${::php_domain_3}",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_domain_3":
    name   => "/var/www/${::php_domain_3}/zu",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->

  exec { "phpapp_download_src_1":
    command => "git clone ${::php_gitrepo} /var/www/${::php_domain_1}/zu/",
    path    => "/usr/local/bin/:/usr/bin/:/bin/",
    cwd     => "/var/www/${::php_domain_1}/zu/",
    require => Class["phpapp::prework"]
  } ->

  exec { "phpapp_download_src_2":
    command => "git clone ${::php_gitrepo} /var/www/${::php_domain_2}/zu/",
    path    => "/usr/local/bin/:/usr/bin/:/bin/",
    cwd     => "/var/www/${::php_domain_2}/zu/",
    require => Class["phpapp::prework"]
  } ->

  exec { "phpapp_download_src_3":
    command => "git clone ${::php_gitrepo} /var/www/${::php_domain_3}/zu/",
    path    => "/usr/local/bin/:/usr/bin/:/bin/",
    cwd     => "/var/www/${::php_domain_3}/zu/",
    require => Class["phpapp::prework"]
  } ->

  file { "phpapp_configfile_1":
    name    => "/var/www/${::php_domain_1}/zu/config/main.ini",
    ensure  => link,
    target  => "/srv/config/ffe/${::php_appconfig}/${::php_domain_1}/config.js",
    require => Class["phpapp::prework"]
  } ->

  file { "phpapp_configfile_2":
    name    => "/var/www/${::php_domain_2}/zu/config/main.ini",
    ensure  => link,
    target  => "/srv/config/ffe/${::php_appconfig}/${::php_domain_2}/config.js",
    require => Class["phpapp::prework"]
  } ->

  file { "phpapp_configfile_3":
    name    => "/var/www/${::php_domain_3}/zu/config/main.ini",
    ensure  => link,
    target  => "/srv/config/ffe/${::php_appconfig}/${::php_domain_3}/config.js",
    require => Class["phpapp::prework"]
  }
#  ->
#
#  file { "phpapp_logs" :
#    name   => "/srv/${::php_appname}/logs",
#    ensure => "directory",
#    owner  => "www-data",
#    group  => "www-data",
#    mode   => 775,
#  }

  include phpapp::system
}
