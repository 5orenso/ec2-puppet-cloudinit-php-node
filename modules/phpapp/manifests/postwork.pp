class phpapp::postwork {

  file { "apache2_apache2_conf":
    name => "/etc/apache2/apache2.conf",
    ensure => file,
    owner => root,
    group => root,
    mode  => 644,
    source => "/srv/config/${::apache_config}/apache2.conf",
    require => [Class["phpapp::prework"], Class["phpapp::core"]],
  } ->

  file { "apache2_ports_conf":
    name => "/etc/apache2/ports.conf",
    ensure => file,
    owner => root,
    group => root,
    mode  => 644,
    source => "/srv/config/${::apache_config}/ports.conf",
    require => [Class["phpapp::prework"], Class["phpapp::core"]],
  }

  file { "apache2_httpd_conf":
    name => "/etc/apache2/httpd.conf",
    ensure => present,
    content => "",
  } ->

  file { "apache2_sites_enabled_1":
    name => "/etc/apache2/sites-enabled/${::php_domain_1}",
    notify  => Service["apache2"],  # this sets up the relationship
    ensure => file,
    owner => root,
    group => root,
    mode  => 644,
    source => "/srv/config/${::apache_config}/sites-enabled/${::php_domain_1}",
    require => [Class["phpapp::prework"], Class["phpapp::core"]],
  }

  file { "varnish_config":
    name => "/etc/default/varnish",
    ensure => file,
    owner => root,
    group => root,
    mode  => 644,
    source => "/srv/config/${::etc_config}/default/varnish",
    require => [Class["phpapp::prework"], Class["phpapp::core"]],
  } ->

  file { "default_varnish":
    name => "/etc/varnish/default.vcl",
    notify  => Service["varnish"],  # this sets up the relationship
    ensure => file,
    owner => root,
    group => root,
    mode  => 644,
    source => "/srv/config/${::varnish_config}/default.vcl",
    require => [Class["phpapp::prework"], Class["phpapp::core"]],
  }

}
