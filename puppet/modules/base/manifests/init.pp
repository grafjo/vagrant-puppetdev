class base {

  file { '/etc/motd':
    ensure => file,
    owner => "root",
    group => "root",
    mode => 0644,
    content => "This system is managed by Puppet!\n",
    notify => Exec["apt-get update"],
  }

  exec {"apt-get update":
    command => "/usr/bin/apt-get update",
    refreshonly => "true",
  }
 
  if !defined(Package["vim"]){
    package {"vim":
      ensure => installed,
    }
  }

  if !defined(Package["wget"]) {
    package {"wget":
      ensure => installed,
    }
  }

  if !defined(Package["bash-completion"]) {
    package {"bash-completion":
      ensure => installed,
    }
  }

  if !defined(Package["nmap"]) {
    package {"nmap":
      ensure => installed,
    }
  }


}
