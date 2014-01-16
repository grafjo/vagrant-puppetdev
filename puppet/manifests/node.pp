# define your required node configuration via puppet here
#
stage {"pre":
  before => Stage["main"],
}

class {'debian_base':
  stage => "pre",
}

class { 'nodejs':
  version      => 'stable',
  make_install => false,
}
