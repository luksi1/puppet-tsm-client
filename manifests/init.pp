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
  $server_name             = $::tsm::params::server_name,
  $tcp_server_address      = $::tsm::params::tcp_server_address,
  $managed_services        = $::tsm::params::managed_services,
  $memory_efficient_backup = $::tsm::params::memory_efficient_backup,
  $comm_method             = $::tsm::params::comm_method,
  $tcp_port                = $::tsm::params::tcp_port,
  $tcp_serveraddress       = $::tsm::params::tcp_serveraddress,
  $password_access         = $::tsm::params::password_access,
  $sched_mode              = $::tsm::params::sched_mode,
  $node_name               = $::tsm::params::sched_mode,
  $domain                  = $::tsm::params::domain,
  $tcp_client_port         = $::tsm::params::tcp_client_port,
  $http_port               = $::tsm::params::http_port,
  $tcp_window_size         = $::tsm::params::tcp_window_size,
  $tcp_no_delay            = $::tsm::params::tcp_no_delay,
  $resource_util           = $::tsm::params::resource_util,
  $txn_byte_limit          = $::tsm::params::txn_byte_limit,
  $log_dir                 = $::tsm::params::log_dir,
  $error_log_name          = $::tsm::params::error_log_name,
  $sched_log_name          = $::tsm::params::sched_log_name,
  $sched_log_ret           = $::tsm::params::sched_log_ret,
  $error_log_ret           = $::tsm::params::error_log_ret,
  $incl_excl               = $::tsm::params::incl_excl,
  $service_name            = $::tsm::params::service_name,
  $service_ensure          = $::tsm::params::service_ensure,
  $service_enable          = $::tsm::params::service_enable,
  $service_provider        = $::tsm::params::service_provider,
  $service_manage          = $::tsm::params::service_manage,
  $tivsm_ba_package        = $::tsm::params::tivsm_ba_package,
  $tivsm_api_package       = $::tsm::params::tivsm_api_backup,
  $gskcrypt_package        = $::tsm::params::gskcrypt_package,
  $gskssl_package          = $::tsm::params::gskssl_package) {
  validate_string($server_name)
  validate_string($tcp_server_address)
  validate_string($node_name)
  validate_string($managed_services)
  validate_re($memory_efficient_backup, ['^yes$', '^no$'])
  validate_re($comm_method, ['^TCPip$', '^SHAREdmem$'])
  validate_numeric($tcp_port)
  validate_re($password_access, ['^generate$', '^prompt$'])
  validate_re($sched_mode, ['^polling$', '^prompted$'])
  validate_hash($domain)
  validate_numeric($tcp_client_port)
  validate_numeric($tcp_window_size)
  validate_re($tcp_no_delay, ['^yes$', '^no$'])
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

