# Installation of the apache2 web server,mysql,vsftp and wordpress

class { 'apache': 
    mpm_module => 'prefork',
}
apache::vhost { 'manyax.localhost':
  port                => '80',
  docroot             => '/var/www/wordpress',
  fallbackresource    => '/index.php',
}

class {'::apache::mod::php':
  package_name => "php54-php",
  path         => "${::apache::params::lib_path}/libphp54-php5.so",
}



class { '::mysql::server':
  root_password           => 'default',
  remove_default_accounts => true,
  override_options        => $override_options
}
	
class { 'vsftpd':
  anonymous_enable  => 'NO',
  write_enable      => 'YES',
  ftpd_banner       => 'Manyax FTP Server',
  chroot_local_user => 'NO',
}

wordpress { 'wordpress': }

package { "xrdp":
    ensure => "latest"
