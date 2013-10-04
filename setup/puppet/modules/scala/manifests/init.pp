class scala {

file { '/tmp/scala-2.10.3.tgz':
    ensure => present,
    require => Exec['Fetch scala'],
  }

  exec { 'Fetch scala':
    cwd => '/tmp',
    command => 'wget http://www.scala-lang.org/files/archive/scala-2.10.3.tgz',
    creates => '/tmp/scala-2.10.3.tgz',
  }

  exec { 'Extract scala':
    cwd     => '/usr/local',
    command => 'tar xvf /tmp/scala-2.10.3.tgz',
    creates => '/usr/local/scala-2.10.3',
    require => Exec['Fetch scala'];
  }

  file { '/usr/local/scala-2.10.3':
    require => Exec['Extract scala'];
  }

  file { '/usr/local/scala':
    ensure  => link,
    target  => '/usr/local/scala-2.10.3',
    require => File['/usr/local/scala-2.10.3'];
  }
  
  file { '/opt/boxen/bin/scala': 
    ensure => link,
    target  => '/usr/local/scala/bin/scala',
    require => File['/usr/local/scala'];
  }



}
