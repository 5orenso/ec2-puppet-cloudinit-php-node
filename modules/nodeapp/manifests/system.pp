class nodeapp::system {

	file { "nodeapp_upstart":
        name => "/etc/init/${::node_appname}.conf",
        ensure => present,
        owner => root,
        group => root,
        mode  => 644,
        source => "/srv/${::node_appname}/etc/upstart.conf",
        require => [Class["nodeapp::prework"], Class["nodeapp::core"]],
    } ->

    file { "nodeapp_logrotate":
        name => "/etc/logrotate.d/${::node_appname}",
        ensure => present,
        owner => root,
        group => root,
        mode  => 644,
        source => "/srv/${::node_appname}/etc/logrotate.conf",
        require => [Class["nodeapp::prework"], Class["nodeapp::core"]],
    } ->


  	file { "nodeapp_initd":
      name => "/etc/init.d/${::node_appname}",
    	ensure => link,
    	target => "/lib/init/upstart-job",
  	}

	service { "nodeapp_service":
      name => "${::node_appname}",
  		ensure     => "running",
  		# provider   => "upstart",
  		hasrestart => "true",
  		hasstatus  => "false",
  		enable     => "true",
  		subscribe  => [File["nodeapp_upstart"], File["nodeapp_initd"]],
	}

}