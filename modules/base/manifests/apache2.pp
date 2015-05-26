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

}
