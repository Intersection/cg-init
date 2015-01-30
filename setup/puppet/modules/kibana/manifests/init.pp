class kibana {

   file { '/tmp/kibana-3.1.2.tar.gz':
    ensure => present,
    require => Exec['Fetch kibana'],
  }

   exec { 'Fetch kibana':
    cwd => '/tmp',
    command => 'wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz',
    creates => '/tmp/kibana-3.1.2.tar.gz',
  }

   exec { 'Extract kibana':
    cwd     => '/opt',
    command => 'tar xvf /tmp/kibana-3.1.2.tar.gz',
    creates => '/opt/kibana-3.1.2',
    require => Exec['Fetch kibana'];
  }

}
