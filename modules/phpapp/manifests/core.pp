class phpapp::core {
  notice("I am a php ${::php_appname} and want the software")

  exec { "phpapp_download_config":
    command => "git clone ${::gitconfigrepo} /srv/config/",
    path    => "/usr/local/bin/:/usr/bin/:/bin/",
    cwd     => "/srv/",
    require => Class["phpapp::prework"]
  } ->
  exec { 'jboss chown':
    command  => "/bin/chown -R www-data:www-data /srv/config/",
    require  => Excec['phpapp_download_config']
  } ->
  file { "phpapp_ensure_domain_1":
    name   => "/var/www/${::php_domain_1}",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_domain_zu_1":
    name   => "/var/www/${::php_domain_1}/zu",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_images_1":
    name   => "/var/www/${::php_domain_1}/images",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_images_cache_1":
    name   => "/var/www/${::php_domain_1}/images/cache",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_images_index_1":
    name    => "/var/www/${::php_domain_1}/images/index.php",
    ensure  => link,
    target  => "/var/www/${::php_domain_1}/zu/images/index.php",
    require => Class["phpapp::prework"]
  } ->
  file { "phpapp_ensure_images_pix_1":
    name    => "/var/www/${::php_domain_1}/images/pix.gif",
    ensure  => link,
    target  => "/var/www/${::php_domain_1}/zu/images/pix.gif",
    require => Class["phpapp::prework"]
  } ->

  file { "phpapp_ensure_domain_2":
    name   => "/var/www/${::php_domain_2}",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_domain_zu_2":
    name   => "/var/www/${::php_domain_2}/zu",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_images_2":
    name   => "/var/www/${::php_domain_2}/images",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_images_cache_2":
    name   => "/var/www/${::php_domain_2}/images/cache",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_images_index_2":
    name    => "/var/www/${::php_domain_2}/images/index.php",
    ensure  => link,
    target  => "/var/www/${::php_domain_2}/zu/images/index.php",
    require => Class["phpapp::prework"]
  } ->
  file { "phpapp_ensure_images_pix_2":
    name    => "/var/www/${::php_domain_2}/images/pix.gif",
    ensure  => link,
    target  => "/var/www/${::php_domain_2}/zu/images/pix.gif",
    require => Class["phpapp::prework"]
  } ->

  file { "phpapp_ensure_domain_3":
    name   => "/var/www/${::php_domain_3}",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_domain_zu_3":
    name   => "/var/www/${::php_domain_3}/zu",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_images_3":
    name   => "/var/www/${::php_domain_3}/images",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_images_cache_3":
    name   => "/var/www/${::php_domain_3}/images/cache",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 775,
  } ->
  file { "phpapp_ensure_images_index_3":
    name    => "/var/www/${::php_domain_3}/images/index.php",
    ensure  => link,
    target  => "/var/www/${::php_domain_3}/zu/images/index.php",
    require => Class["phpapp::prework"]
  } ->
  file { "phpapp_ensure_images_pix_3":
    name    => "/var/www/${::php_domain_3}/images/pix.gif",
    ensure  => link,
    target  => "/var/www/${::php_domain_3}/zu/images/pix.gif",
    require => Class["phpapp::prework"]
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
    target  => "/srv/config/${::php_appconfig}/${::php_domain_1}/main.ini",
    require => Class["phpapp::prework"]
  } ->

  file { "phpapp_configfile_2":
    name    => "/var/www/${::php_domain_2}/zu/config/main.ini",
    ensure  => link,
    target  => "/srv/config/${::php_appconfig}/${::php_domain_2}/main.ini",
    require => Class["phpapp::prework"]
  } ->

  file { "phpapp_configfile_3":
    name    => "/var/www/${::php_domain_3}/zu/config/main.ini",
    ensure  => link,
    target  => "/srv/config/${::php_appconfig}/${::php_domain_3}/main.ini",
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
