class nginx {
  package {
    "nginx":
      ensure => present
  }
  service {
    "nginx":
      ensure => true,
      enable => true
  }
  file {
    "/etc/nginx/sites-enabled/app":
      source => "puppet:///modules/nginx/app",
      owner => root,
      group => root,
      notify => Service["nginx"],
      require => Package["nginx"];
  }
  exec {
    "remove_default_nginx_config":
      require => Package["nginx"],
      before => Service["nginx"],
      onlyif => "sudo ls /etc/nginx/sites-enabled/default",
      command => "sudo rm /etc/nginx/sites-enabled/default"
  }
}

