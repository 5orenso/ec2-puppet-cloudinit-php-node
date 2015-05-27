class phpapp::prework {

  file { "phpapp_srv" :
    name   => "/var/www/",
    ensure => "directory",
    owner  => "root",
    group  => "www-data",
    mode   => 750,
  }

  file { "phpapp_log" :
    name   => "/var/log/${::php_appname}",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 750,
  }

  file { "phpapp_run" :
    name   => "/var/run/${::php_appname}",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 750,
  }
}