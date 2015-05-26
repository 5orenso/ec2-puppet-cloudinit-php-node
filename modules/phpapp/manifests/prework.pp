class phpapp::prework {

  file { "phpapp_srv" :
    name   => "/var/www/",
    ensure => "directory",
    owner  => "root",
    group  => "www-data",
    mode   => 750,
  }

  file { "phpapp_log" :
    name   => "/var/log/${::node_appname}",
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 750,
  }

}