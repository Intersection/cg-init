class elasticsearch {

    file { '/tmp/elasticsearch-1.4.1.deb':
    ensure => present,
    require => Exec['Fetch elasticsearch'],
  }

   exec { 'Fetch elasticsearch':
    cwd => '/tmp',
    command => 'wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.1.deb',
    creates => '/tmp/elasticsearch-1.4.1.deb',
  }
  
  exec { 'install elasticsearch':
      cwd => '/tmp',
      command => 'sudo dpkg -i elasticsearch-1.4.1.deb',
      require => Exec['Fetch elasticsearch'];
   }

    service {
    "elasticsearch":
      ensure => running,
      require => Exec["install elasticsearch"]
  }

  file {
      "/etc/elasticsearch/elasticsearch.yml":
      source => "puppet:///modules/elasticsearch/elasticsearch.yml",
      owner => ubuntu,
      group => root,
      require => Exec["install elasticsearch"];
  } 

}
