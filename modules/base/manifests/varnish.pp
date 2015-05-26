class base::varnish {
  notice('Varnish beeing installed.')

  package { 'varnish' :
    ensure => installed,
  }

  # define the service to restart
  service { "varnish":
    ensure  => "running",
    enable  => "true",
    require => Package["varnish"],
  }

}
