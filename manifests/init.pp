# Class: tsm
#
# This module manages tsm
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class tsm (
  $server_name             = undef,
  $tcp_server_address      = undef,
  $node_name               = undef,
  $managed_services        = 'WEBCLIENT SCHEDULE',
  $memory_efficient_backup = 'yes',
  $comm_method             = 'TCPip',
  $tcp_port                = '1500',
  $password_access         = 'generate',
  $sched_mode              = 'POLLING',
  $domain                  = ['ALL-LOCAL'],
  $tcp_client_port         = '1501',
  $http_port               = '1581',
  $tcp_window_size         = '63',
  $tcp_no_delay            = 'no',
  $resource_util           = '5',
  $txn_byte_limit          = '25600',
  $log_dir                 = '/var/log',
  $error_log_name          = '/var/log/tsm/err.log',
  $sched_log_name          = '/var/log/tsm/sched.log',
  $sched_log_ret           = '30',
  $error_log_ret           = '30',
  $incl_excl               = '/opt/tivoli/tsm/client/ba/bin/inexclude_file',
  $service_ensure          = 'running',
  $service_enable          = true,
  $service_name            = 'dsmcad',
  $service_provider        = undef,
  $service_manage          = true,
  $tivsm_ba_package        = $::tsm::params::tivsm_ba_package,
  $tivsm_api_package       = $::tsm::params::tivsm_api_backup,
  $gskcrypt_package        = $::tsm::params::gskcrypt_package,
  $gskssl_package          = $::tsm::params::gskssl_package) {
  validate_string($server_name)
  validate_string($tcp_server_address)
  validate_string($node_name)
  validate_string($managed_services)
  validate_re($memory_efficient_backup, ['^yes$', '^no$'], "Should be 'yes' or 'no'. Got $memory_efficient" )
  validate_re($comm_method, ['^TCPip$', '^SHAREdmem$'], "Should be 'TCPip' or 'SSHAREdmem'. Got $comm_method.")
  validate_numeric($tcp_port)
  validate_re($password_access, ['^generate$', '^prompt$'], "Should be 'generate' or 'prompt'. Got $password_access")
  validate_re($sched_mode, ['^POLLING$', '^PROMPTED$'], "Should be 'POLLING' or 'PROMPTED'. Got $sched_mode.")
  validate_array($domain)
  validate_numeric($tcp_client_port)
  validate_numeric($tcp_window_size)
  validate_re($tcp_no_delay, ['^yes$', '^no$'], "Should be 'yes' or 'no'. Got $tcp_no_delay")
  validate_numeric($resource_util)
  validate_numeric($txn_byte_limit)
  validate_absolute_path($error_log_name)
  validate_absolute_path($sched_log_name)
  validate_numeric($sched_log_ret)
  validate_numeric($error_log_ret)
  validate_absolute_path($incl_excl)
  validate_bool($service_enable)
  validate_string($service_name)

  if $service_provider {
    validate_string($service_provider)
  }
  validate_bool($service_manage)

}

