# define your required node configuration via puppet here
#

node base {
  class { "debian_base": 
    stage => "pre",
  }
}

node 'node1.example.com' inherits base {
}

node 'node2.example.com' inherits base {
}

node 'node3.example.com' inherits base {
}
