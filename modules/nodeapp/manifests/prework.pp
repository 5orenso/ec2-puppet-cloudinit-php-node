class nodeapp::prework {

	file { "nodeapp_srv" :
        name   => "/srv/",
        ensure => "directory",
        owner  => "root",
        group  => "www-data",
        mode   => 750,
    }

    file { "nodeapp_log" :
        name   => "/var/log/${::appname}",
        ensure => "directory",
        owner  => "www-data",
        group  => "www-data",
        mode   => 750,
    }

    file { "nodeapp_run" :
        name   => "/var/run/${::appname}",
        ensure => "directory",
        owner  => "www-data",
        group  => "www-data",
        mode   => 750,
    }
    
}