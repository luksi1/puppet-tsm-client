class tsm::params {
  $server_name = undef
  $tcp_server_address = undef
  $node_name = undef
  $managed_services = 'WEBCLIENT SCHEDULE'
  $memory_efficient_backup = 'yes'
  $comm_method = 'TCPip'
  $tcp_port = '1500'
  $password_access = 'generate'
  $sched_mode = 'POLLING'
  $domain = ['ALL-LOCAL']
  $tcp_client_port = '1501'
  $http_port = '1581'
  $tcp_window_size = '63'
  $tcp_no_delay = 'no'
  $resource_util = '5'
  $txn_byte_limit = '25600'
  $log_dir = '/var/log'
  $error_log_name = '/var/log/tsm/err.log'
  $sched_log_name = '/var/log/tsm/sched.log'
  $sched_log_ret = '30'
  $error_log_ret = '30'
  $incl_excl = '/opt/tivoli/tsm/client/ba/bin/inexclude_file'
  $service_ensure = 'running'
  $service_enable = true
  $service_name = 'dsmcad'
  $service_provider = undef
  $service_manage = true

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
