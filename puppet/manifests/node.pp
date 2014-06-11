# define your required node configuration via puppet here
#

node 'vagrant.example.com' {

  class { 'java':
    distribution => 'jre',
    before => [
      Class['elasticsearch'],
      Class['graylog2::server'],
      Class['graylog2::web']
    ],
  }

  class {'elasticsearch':
    cluster_name => 'graylog2',
    repo_baseurl => 'http://packages.elasticsearch.org/elasticsearch/0.90/centos',
    before => [
      Class['graylog2::server'],
      Class['graylog2::web']
    ],
  }

  class {'mongodb':
    before => [
      Class['graylog2::server'],
      Class['graylog2::web']
    ],
  }

  class {'graylog2::repo':}->
  class { 'graylog2::server':
    root_username      => 'admin',
    root_password_sha2 => '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', # admin
    password_secret    => 'You MUST set a secret to secure/pepper the stored user passwords here. Use at least 64 characters',
    rest_listen_uri    => 'http://192.168.33.10:12900/',
    rest_transport_uri => 'http://192.168.33.10:12900/',
  }->
  class { 'graylog2::web':
    application_secret   => 'You MUST set a secret to secure/pepper the stored user passwords here. Use at least 64 characters',
    graylog2_server_uris => ["http://192.168.33.10:12900/"],
  }

}
