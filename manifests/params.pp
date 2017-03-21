class tsm::params {
  case $::osfamily {
    'Debian'         : {
      $copy_path = "/bin/cp" 
      $tivsm_ba_package = 'tivsm-ba'
      $tivsm_api_package = $::architecture ? {
        'i386'   => 'tivsm-api',
        'x86_64' => 'tivsm-api64',
        'amd64' => 'tivsm-api64',
        default  => undef,
      } }

    'RedHat', 'Suse' : {
      $tivsm_ba_package = 'TIVsm-BA'
      $tivsm_api_package = $::architecture ? {
        'i386'   => 'TIVsm-API',
        'x86_64' => 'TIVsm-API64',
        'amd64' => 'TIVsm-API64',
        default  => undef,
      } 
      $copy_path = "/bin/cp"
    }

    default          : {
      $tivsm_ba_package = undef
      $tivsm_api_package = undef
      $copy_path = undef
    }

  }

}
