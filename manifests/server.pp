#
define tsm::server (
  $server_name              = $title,
  $tcp_server_address       = undef,
  $node_name                = $::tsm::hostname,
  $managed_services         = $::tsm::managed_services,
  $memory_efficient_backup  = $::tsm::memory_efficient_backup,
  $comm_method              = $::tsm::comm_method,
  $tcp_port                 = $::tsm::tcp_port,
  $password_access          = $::tsm::password_access,
  $sched_mode               = $::tsm::sched_mode,
  $domain                   = $::tsm::domain,
  $tcp_client_port          = $::tsm::tcp_client_port,
  $http_port                = $::tsm::http_port,
  $tcp_window_size          = $::tsm::tcp_window_size,
  $tcp_no_delay             = $::tsm::tcp_no_delay,
  $resource_util            = $::tsm::resource_util,
  $txn_byte_limit           = $::tsm::txn_byte_limit,
  $log_dir                  = $::tsm::log_dir,
  $error_log_name           = $::tsm::error_log_name,
  $sched_log_name           = $::tsm::sched_log_name,
  $sched_log_ret            = $::tsm::sched_log_ret,
  $error_log_ret            = $::tsm::error_log_ret,
  $incl_excl                = $::tsm::incl_excl
) {

  validate_string($server_name)
  validate_string($tcp_server_address)

  include ::tsm


  concat::fragment { "tsm_sys_file_${server_name}":
    target  => "${::tsm::dsm_sys_file}.puppet",
    content => template("tsm/dsm.sys.erb")
  }

}

