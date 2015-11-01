class phpapp::system {

  file { "phpapp_logrotate_1":
    name => "/etc/logrotate.d/${::php_appname}_1",
    ensure => present,
    owner => root,
    group => root,
    mode  => 644,
    source => "/var/www/${::php_domain_1}/zu/etc/logrotate.conf",
    require => [Class["phpapp::prework"], Class["phpapp::core"]],
  }
  file { "phpapp_logrotate_2":
    name => "/etc/logrotate.d/${::php_appname}_2",
    ensure => present,
    owner => root,
    group => root,
    mode  => 644,
    source => "/var/www/${::php_domain_2}/zu/etc/logrotate.conf",
    require => [Class["phpapp::prework"], Class["phpapp::core"]],
  }
  file { "phpapp_logrotate_3":
    name => "/etc/logrotate.d/${::php_appname}_3",
    ensure => present,
    owner => root,
    group => root,
    mode  => 644,
    source => "/var/www/${::php_domain_3}/zu/etc/logrotate.conf",
    require => [Class["phpapp::prework"], Class["phpapp::core"]],
  }
  include phpapp::postwork

}