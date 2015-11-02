class nodeapp::core {
    notice("I am a node ${::node_appname} and want the software")

#    exec { "nodeapp_download_config":
#        command => "git clone ${::gitconfigrepo} /srv/config/",
#        path    => "/usr/local/bin/:/usr/bin/:/bin/",
#        cwd     => "/srv/",
#        require => Class["nodeapp::prework"]
#    } ->
#
#    exec { 'nodeapp_www_data_chown':
#        command  => "/bin/chown -R www-data:www-data /srv/"
#    } ->
#
#    exec { 'nodeapp_www_data_chmod':
#        command  => "/bin/chmod -R 755 /srv/"
#    } ->

    exec { "nodeapp_download_src":
        command => "git clone ${::node_gitrepo} /srv/${::node_appname}/",
        path    => "/usr/local/bin/:/usr/bin/:/bin/",
        cwd     => "/srv/",
        require => Class["nodeapp::prework"]
    } ->

    exec { "nodeapp_unpack_src":
        environment => [ "HOME=/root/" ],
        command => "sudo npm install --production",
        path    => "/usr/local/bin/:/usr/bin/:/bin/",
        cwd     => "/srv/${::node_appname}/",
        require => Class["nodeapp::prework"]
    } ->

    file { "nodeapp_configfile":
        name    => "/srv/${::node_appname}/config/config.js",
        ensure  => link,
        target  => "/srv/config/${::node_appconfig}/config.js",
        require => Class["nodeapp::prework", "phpapp::core"]
    } ->

    file { "nodeapp_logs" :
        name   => "/srv/${::node_appname}/logs",
        ensure => "directory",
        owner  => "www-data",
        group  => "www-data",
        mode   => 775,
    }

    include nodeapp::system
}
