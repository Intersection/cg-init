class sbt {

 file { '/tmp/sbt-launch.jar':
    ensure => present,
    require => Exec['Fetch sbt'],
  }

exec { 'Fetch sbt':
    cwd => '/tmp',
    command => 'wget http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.5/sbt-launch.jar',
    creates => '/tmp/sbt-launch.jar',
  }


file { "/usr/bin/sbt-launch.jar":
    owner => ubuntu,
    group => root,
    source => "/tmp/sbt-launch.jar",
    require => Exec['Fetch sbt'];
}

file {'sbt':
      path    => '/usr/bin/sbt',
      ensure  => present,
      mode    => 0775,
      content => "java -Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512M -Dsbt.ivy.home=/home/ubuntu/product/.ivy2/ -jar /usr/bin/sbt-launch.jar \"$@\"",
      require => File['/usr/bin/sbt-launch.jar'];  
  }


}

