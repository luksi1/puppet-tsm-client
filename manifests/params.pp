class tsm::params {
  # Packages
  $gskcrypt_package = $architecture ? {
    'i386'   => 'gskcrypt',
    'amd64'  => 'gskcrypt64',
    'x86_64' => 'gskcrypt64',
    default  => undef,
  }
  $gskssl_package = $architecture ? {
    'i386'   => 'gskssl',
    'x86_64' => 'gskssl64',
    default  => undef,
  }

  case $::osfamily {
    'Debian'         : {
      $tivsm_ba_package = 'tivsm-ba'
      $tivsm_api_package = $architecture ? {
        'i386'   => 'tivsm-api',
        'x86_64' => 'tivsm-api64',
        default  => undef,
      } }

    'RedHat', 'Suse' : {
      $tivsm_ba_package = 'TIVsm-BA'
      $tivsm_api_package = $architecture ? {
        'i386'   => 'TIVsm-API',
        'x86_64' => 'TIVsm-API64',
        default  => undef,
      } }
    default          : {
      $tivsm_ba_package = undef
      $tivsm_api_package = undef
    }

  }

}
