class mongodb{

 exec { 'Import mongodb key':
    cwd => '/tmp',
    command => 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10',
  }

 exec {'Add sources':
  command => "sudo echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' >> /etc/apt/sources.list",
  require => Exec['Import mongodb key'];
  }

 exec { 'Update Repos':
   command => 'sudo apt-get update',
   require => Exec['Add sources'];
  }

  package {
    "mongodb-10gen":
    ensure => installed,
    require => Exec['Update Repos'];
  }

 service {
    "mongodb":
      ensure => running,
      require => Package["mongodb-10gen"];
  }


}
