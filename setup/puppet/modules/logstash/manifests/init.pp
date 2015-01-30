class logstash {

  exec { 'Import key':
    cwd => '/tmp',
    command => 'sudo wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -',
  }


 exec { 'add repo':
    command => "sudo echo 'deb http://packages.elasticsearch.org/logstash/1.4/debian stable main' >> /etc/apt/sources.list ",
    require => Exec['Import key'];
  } 

 exec { 'Update Logstash Repos':
   command => 'sudo apt-get update',
   require => Exec['add repo'];
  }


  package {
    "logstash":
    ensure => installed,
    require => Exec['Update Logstash Repos'];
  }

 service {
    "logstash":
      ensure => running,
      require => Package["logstash"];
  } 

  file {
      "/etc/logstash/conf.d/logstash-application.conf":
      source => "puppet:///modules/logstash/logstash-application.conf",
      owner => ubuntu,
      group => root,
      require => Package["logstash"];
  }
}
