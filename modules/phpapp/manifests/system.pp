class phpapp::system {

  file { "phpapp_logrotate":
    name => "/etc/logrotate.d/${::php_appname}",
    ensure => present,
    owner => root,
    group => root,
    mode  => 644,
    source => "/var/www/${::php_domain_1}/zu/etc/logrotate.conf",
    require => [Class["phpapp::prework"], Class["phpapp::core"]],
  }

}