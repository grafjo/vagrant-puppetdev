# define your required node configuration via puppet here
#
stage {"pre":
  before => Stage["main"],
}

class {"base":
  stage => "pre",
}

class { 'nodejs':
  version => 'stable',
}
