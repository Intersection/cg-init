class nginx {

  exec { 'Import nginx key':
    cwd => '/tmp',
    command => 'wget http://nginx.org/keys/nginx_signing.key; sudo apt-key add nginx_signing.key',
  }


 exec { 'add nginx repo':
    command => "sudo echo 'deb http://nginx.org/packages/ubuntu/ trusty nginx' >> /etc/apt/sources.list ",
    require => Exec['Import nginx key'];
  }

 exec { 'update nginx repos':
     command => 'sudo apt-get update',
     require => Exec['add nginx repo'];
 }

  package {
    "nginx":
      ensure => present,
       require => Exec['update nginx repos'];
  }

  
  service {
    "nginx":
      ensure => true,
      enable => true,
      require => Package["nginx"];
  }

  file {
    "/etc/nginx/conf.d/default.conf":
      source => "puppet:///modules/nginx/default.conf",
      owner => root,
      group => root,
      notify => Service["nginx"],
      require => Exec["remove_default_nginx_config"];
  }
  
    exec {
    "remove_default_nginx_config":
      require => Package["nginx"],
      before => Service["nginx"],
      onlyif => "sudo ls /etc/nginx/conf.d/default.conf",
      command => "sudo rm /etc/nginx/conf.d/default.conf"
  }

}

