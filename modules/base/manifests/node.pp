class base::node {
    notice('Node.js beeing installed.')

    package { 'python-software-properties' :
        ensure => installed,
    }

    exec { 'add_node_repo' :
        command => 'add-apt-repository ppa:chris-lea/node.js',
        path    => '/usr/local/bin/:/usr/bin/:/bin/',
        require => Package['python-software-properties'],
    }

    exec { 'update_repos' :
        command => 'apt-get update',
        path    => '/usr/local/bin/:/usr/bin/:/bin/',
        require => Exec['add_node_repo'],
    }

    # Install Node.js package
    package { 'nodejs':
        ensure => installed,
        require => Exec['update_repos'],
    }

}

