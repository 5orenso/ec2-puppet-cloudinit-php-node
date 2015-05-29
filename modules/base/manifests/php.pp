class base::php {
  notice('PHP beeing installed.')

  package { 'php5' :
    ensure => installed,
  }
  package { 'php5-curl' :
    ensure => installed,
  }
  package { 'php5-dev' :
    ensure => installed,
  }
  package { 'php5-cli' :
    ensure => installed,
  }
  package { 'php-pear' :
    ensure => installed,
  }
  package { 'php5-imagick' :
    ensure => installed,
  }
  package { 'php5-gd' :
    ensure => installed,
  }
  exec { 'set_php_pear_config' :
    command => 'pear config-set auto_discover 1',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    require => Package['php5'],
  }
#  exec { 'add_pear_repo_1' :
#    command => 'pear channel-discover pear.pearplex.net',
#    path    => '/usr/local/bin/:/usr/bin/:/bin/',
##    require => Exec['set_php_pear_config'],
#    require => Package['php5'],
#  }
#  exec { 'install_php_excel' :
#    command => 'pear install pearplex/PHPExcel',
#    path    => '/usr/local/bin/:/usr/bin/:/bin/',
#    require => Exec['add_pear_repo_1'],
#  }
  exec { 'install_php_main' :
    command => 'pear install Mail',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    require => Package['php5', 'php5-dev', 'php5-cli', 'php-pear']
  }

  exec { 'install_php_mongo_driver' :
    command => 'pecl install mongo',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    require => Package['php5', 'php5-dev', 'php5-cli', 'php-pear']
  }


  file { "phpapp_www" :
    name   => "/var/www/",
    ensure => "directory",
    owner  => "root",
    group  => "www-data",
    mode   => 750,
  } ->

  file { "phpapp_www_lib" :
    name   => "/var/www/lib/",
    ensure => "directory",
    owner  => "root",
    group  => "www-data",
    mode   => 750,
  } ->

  exec { 'install_php_twig_download' :
    command => 'wget https://github.com/twigphp/Twig/archive/v1.18.1.tar.gz -O /var/www/lib/v1.18.1.tar.gz',
    path    => '/usr/local/bin/:/usr/bin/:/bin/'
  } ->
  exec { 'install_php_twig_unpack' :
    command => 'tar -zxvf /var/www/lib/v1.18.1.tar.gz -C /var/www/lib/',
    path    => '/usr/local/bin/:/usr/bin/:/bin/'
  } ->
  exec { 'install_php_twig_symlink' :
    command => 'ln -s /var/www/lib/Twig-1.18.1 /var/www/lib/Twig',
    path    => '/usr/local/bin/:/usr/bin/:/bin/'
  } ->

  exec { 'install_php_aws_download' :
    command => 'wget https://github.com/aws/aws-sdk-php/releases/download/3.0.0/aws.phar -O /var/www/lib/aws.phar',
    path    => '/usr/local/bin/:/usr/bin/:/bin/'
  } ->

  exec { 'install_php_excel_download' :
    command => 'wget https://s3-eu-west-1.amazonaws.com/ffe-static-web/php/PHPExcel_1.8.0.zip -O /var/www/lib/PHPExcel_1.8.0.zip',
    path    => '/usr/local/bin/:/usr/bin/:/bin/'
  } ->
  exec { 'install_php_excel_unpack' :
    command => 'unzip /var/www/lib/PHPExcel_1.8.0.zip -d /var/www/lib/',
    path    => '/usr/local/bin/:/usr/bin/:/bin/'
  } ->
  exec { 'install_php_excel_symlink' :
    command => 'ln -s /var/www/lib/Classes /var/www/lib/PHPExcel',
    path    => '/usr/local/bin/:/usr/bin/:/bin/'
  }

#
#exec { 'add_php_repo_2' :
#    command => 'pear channel-discover pear.phpunit.de',
#    path    => '/usr/local/bin/:/usr/bin/:/bin/',
#    require => Package['php5'],
#  }
#  exec { 'add_php_repo_3' :
#    command => 'pear channel-discover components.ez.no',
#    path    => '/usr/local/bin/:/usr/bin/:/bin/',
#    require => Package['php5'],
#  }
#  exec { 'add_php_repo_4' :
#    command => 'pear channel-discover pear.symfony.com',
#    path    => '/usr/local/bin/:/usr/bin/:/bin/',
#    require => Package['php5'],
#  }
#  exec { 'install_php_code_coverage' :
#    command => 'pear install phpunit/PHP_CodeCoverage',
#    path    => '/usr/local/bin/:/usr/bin/:/bin/',
#    require => Exec['add_php_repo_2', 'add_php_repo_3', 'add_php_repo_4'],
#  }
#
#
#  PHPUnit
#  sudo pear  channel-discover pear.phpunit.de
#  sudo pear channel-discover components.ez.no
#  sudo pear install phpunit/PHP_CodeCoverage
#  sudo pear channel-discover pear.symfony.com
#  sudo pear install pear.symfony.com/Yaml
#  sudo pear install --alldeps pear.phpunit.de/PHPUnit
#  phpunit UnitTest ./tests/UserTest.php
#  phpunit --help
#
#  sudo pear install Mail
#
#  sudo pear config-set auto_discover 1
#sudo pear install pear.phpunit.de/PHPUnit
#sudo pear install phpunit/DbUnit
#sudo pear install phpunit/PHP_Invoker
#sudo pear install phpunit/PHPUnit_Selenium
#sudo pear install phpunit/PHPUnit_Story
#
#
#
#Xdebug
#sudo pecl install xdebug
#sudo emacs /etc/php5/conf.d/zend.ini
#extension=xdebug.so
#
#sudo service apache2 restart
#php -r 'phpinfo();' |grep xdebug



}
