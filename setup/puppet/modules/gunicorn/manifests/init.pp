class gunicorn {
  package {
    "gunicorn":
      provider => pip
  }
  package {
    "python-pip":
      ensure => installed,
      before => Package["gunicorn"]
  }
  file {
    "/etc/init/app.conf":
      source => "puppet:///modules/gunicorn/app.conf",
      owner => root,
      group => root
  }
  file{
    "/etc/init.d/app":
    ensure => "link",
    target => "/lib/init/upstart-job"
  }
}
