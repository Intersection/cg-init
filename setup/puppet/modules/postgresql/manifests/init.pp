class postgresql {
  $password = "insert_password_here"
  $app_db = "insert_applicaiton_db_name_here"
  package {
    "postgresql-8.4":
      ensure => installed
  }
  package {
    "postgresql-client":
        ensure => installed,
        require => Package['postgresql-8.4']
  }
  package {
    "libpq-dev":
        ensure => installed,
        require => Package['postgresql-8.4']
  }
  file {
    "/etc/postgresql/8.4/main/pg_hba.conf":
      source => "puppet:///modules/postgresql/pg_hba.conf",
      owner => postgres,
      group => postgres,
      notify => Service["postgresql"],
      require => Package["postgresql-8.4"]
  }
  service {
    "postgresql":
      ensure => running,
      require => Package["postgresql-8.4"]
  }
  exec {
    "create_user":
      unless => "sudo -u postgres psql -c \"SELECT * FROM pg_user WHERE usename='ubuntu'\" | grep ubuntu",
      command => "sudo -u postgres createuser -DRS ubuntu",
      require => Package["postgresql-8.4"]
  }
  exec {
    "set_password":
      require => Exec['create_user'],
      command => "sudo -u postgres psql -c \"ALTER USER ubuntu WITH PASSWORD \'$password\'\"",
  }
  exec {
    "grant_createdb":
      require => Exec['create_user'],
      command => "sudo -u postgres psql -c \"ALTER USER ubuntu CREATEDB\"",
  }
  exec {
    "create_db":
      require => Exec['create_user'],
      unless => "sudo -u postgres psql -l | grep $app_db",
      command => "sudo -u postgres createdb -O ubuntu $app_db",
  }
}
