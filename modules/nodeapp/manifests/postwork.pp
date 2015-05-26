class nodeapp::postwork {

	# define the service to start
	service { "nodeapp_service":
		  name    => "$::node_appname",
    	ensure  => "running",
    	enable  => "true",
    	require => Class["nodeapp::system"],
	}
	

}
