# define your required node configuration via puppet here
#
stage {"pre":
  before => Stage["main"],
}

class {'debian_base':
  stage => "pre",
}

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
    repo_baseurl => 'http://packages.elasticsearch.org/elasticsearch/0.90/debian',
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

 class { 'graylog2::repo':
    version => '0.92'
  } ->
  class { 'graylog2::server':
    password_secret            => '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',
    root_password_sha2         => '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',
    elasticsearch_cluster_name => 'graylog2',
    require                    => [
      Class['graylog2::repo'],
    ],
  } ->
  class { 'graylog2::web':
    application_secret => '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',
    require            => Class['graylog2::server'],
  }

  class { 'apache':
    default_vhost     => false,
    default_ssl_vhost => false,
  }

  apache::vhost { 'graylog2':
    port          => 80,
    default_vhost => true,
    docroot       => '/var/www/html',
    vhost_name    => '*',
    rewrites      => [{
        rewrite_cond => ['%{SERVER_PORT} !^443$'],
        rewrite_rule => ['^/(.*) https://%{HTTP_HOST}/$1 [NC,R,L]']
    }],
  }

  apache::vhost { 'graylog2-ssl':
    port       => 443,
    ssl        => true,
    docroot    => '/var/www/html',
    vhost_name => '*',
    proxy_pass => [{
        'path' => '/',
        'url'  => 'http://192.168.33.10:9000/'
    }],
  }

}
