class nodeapp::postwork {

	# define the service to start
	service { "nodeapp_service":
		  name    => "$::appname",
    	ensure  => "running",
    	enable  => "true",
    	require => Class["nodeapp::system"],
	}
	

}
