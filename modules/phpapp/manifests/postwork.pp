class phpapp::postwork {

  file { "apache2_config":
    name => "/etc/apache2/apache2.conf",
    ensure => file,
    owner => root,
    group => root,
    mode  => 644,
    source => "/srv/config/${::apache_config}/apache2.conf",
    require => [Class["phpapp::prework"], Class["phpapp::core"]],
  }

  file { "varnish_config":
    name => "/etc/varnish/default.vcl",
    ensure => file,
    owner => root,
    group => root,
    mode  => 644,
    source => "/srv/config/${::varnish_config}/default.vcl",
    require => [Class["phpapp::prework"], Class["phpapp::core"]],
  }

}
