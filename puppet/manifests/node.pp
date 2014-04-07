# define your required node configuration via puppet here
#
stage {"pre":
  before => Stage["main"],
}

class {'debian_base':
  stage => "pre",
}

class {'mongodb': }
