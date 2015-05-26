class base::varnish {
  notice('Varnish beeing installed.')

  package { 'varnish' :
    ensure => installed,
  }


}
