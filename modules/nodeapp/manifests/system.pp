class nodeapp::system {

	file { "nodeapp_upstart":
        name => "/etc/init/${::appname}.conf",
        ensure => present,
        owner => root,
        group => root,
        mode  => 644,
        source => "/srv/${::appname}/etc/upstart.conf",
        require => [Class["nodeapp::prework"], Class["nodeapp::core"]],
    } ->

    file { "nodeapp_logrotate":
        name => "/etc/logrotate.d/${::appname}",
        ensure => present,
        owner => root,
        group => root,
        mode  => 644,
        source => "/srv/${::appname}/etc/logrotate.conf",
        require => [Class["nodeapp::prework"], Class["nodeapp::core"]],
    } ->


  	file { "nodeapp_initd":
      name => "/etc/init.d/${::appname}",
    	ensure => link,
    	target => "/lib/init/upstart-job",
  	}

	service { "nodeapp_service":
      name => "${::appname}",
  		ensure     => "running",
  		# provider   => "upstart",
  		hasrestart => "true",
  		hasstatus  => "false",
  		enable     => "true",
  		subscribe  => [File["nodeapp_upstart"], File["nodeapp_initd"]],
	}

}