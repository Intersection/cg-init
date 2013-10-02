class mysql-server {
  $password = "insert_password_here"
  $db_version = "insert_db_version_here"
  package { "MySQL-client": ensure => '$db_version' }
  package { "MySQL-server": ensure => '$db_version' }
  package { "MySQL-shared": ensure => '$db_version' }

  exec { "Set MySQL server root password":
    subscribe => [ Package["MySQL-server"], Package["MySQL-client"], Package["MySQL-shared"] ],
    refreshonly => true,
    unless => "mysqladmin -uroot -p$password status",
    path => "/bin:/usr/bin",
    command => "mysqladmin -uroot password $password",
  }
}
