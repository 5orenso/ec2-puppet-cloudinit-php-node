class base::apache2 {
  notice('Apache2 beeing installed.')

  package { 'apache2' :
    ensure => installed,
  }
  exec { 'enable_module_headers' :
    command => 'a2enmod headers',
    path    => '/usr/local/bin/:/usr/bin/:/bin/:/usr/sbin/',
    require => Package['apache2']
  }
  exec { 'enable_module_expires' :
    command => 'a2enmod expires',
    path    => '/usr/local/bin/:/usr/bin/:/bin/:/usr/sbin/',
    require => Package['apache2']
  }
  exec { 'enable_module_rewrite' :
    command => 'a2enmod rewrite',
    path    => '/usr/local/bin/:/usr/bin/:/bin/:/usr/sbin/',
    require => Package['apache2']
  }

  # define the service to restart
  service { "apache2":
    ensure  => "running",
    enable  => "true",
    require => Package["apache2"],
    subscribe => File["/etc/apache2/apache2.conf"],
  }


}
