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
#  exec { 'set_php_pear_config' :
#    command => 'pear config-set auto_discover 1',
#    path    => '/usr/local/bin/:/usr/bin/:/bin/',
#    require => Package['php5'],
#  }
  exec { 'add_pear_repo_1' :
    command => 'pear channel-discover pear.pearplex.net',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
#    require => Exec['set_php_pear_config'],
    require => Package['php5'],
  }
  exec { 'install_php_excel' :
    command => 'pear install pearplex/PHPExcel',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    require => Exec['add_pear_repo_1'],
  }
  exec { 'install_php_main' :
    command => 'pear install Mail',
    path    => '/usr/local/bin/:/usr/bin/:/bin/',
    require => Exec['add_pear_repo_1'],
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
