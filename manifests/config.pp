class tsm::config inherits tsm {
  file { $incl_excl:
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { $tsm::log_dir:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0666',
  } ->
  file { $tsm::error_log_name:
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0666',
  } ->
  file { $tsm::sched_log_name:
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0666',
  }

  file { '/opt/tivoli/tsm/client/ba/bin/dsm.sys':
    ensure => 'present',
    owner  => root,
    group  => root,
    mode   => '0644',
  } ->
  augeas { "dsm.sys":
    lens    => "Spacevars.lns",
    incl    => "/opt/tivoli/client/ba/bin/dsm.sys",
    changes => [
      "set SErvername $tsm::server_name",
      "set MANAGEDSERVICES $tsm::managed_services",
      "set MEMORYEFFICIENTBACKUP $tsm::memory_efficient_backup",
      "set COMMMethod $tsm::comm_method",
      "set TCPPort $tsm::tcp_port",
      "set TCPServeraddress $tsm::tcp_server_address",
      "set PASSWORDACCESS $tsm::password_access",
      "set SCHEDMODE $tsm::sched_mode",
      "set NODENAME $tsm::node_name",
      "set DOMAIN $tsm::domain",
      "set TCPCLIENTPORT $tsm::tcp_client_port",
      "set HTTPPORT $tsm::http_port",
      "set TCPWINDOWSIZE $tsm::tcp_window_size",
      "set TCPNODELAY $tsm::tcp_no_delay",
      "set RESOURCEUTIL $tsm::resource_util",
      "set TXNBYTELIMIT $tsm::txn_byte_limit",
      "set ERRORLOGNAME $tsm::error_log_name",
      "set SCHEDLOGNAME $tsm::sched_log_name",
      "set SCHEDLOGRET $tsm::sched_log_ret",
      "set ERRORLOGRET $tsm::error_log_ret",
      "set INCLExcl $tsm::incl_excl"],
    notify  => Service[$tsm::service_name],
  }

  file { '/opt/tivoli/tsm/client/ba/bin/dsm.opt':
    owner => root,
    group => root,
    mode  => '0644',
  } ->
  augeas { "dsm.opt":
    lens    => "Spacevars.lns",
    incl    => "/opt/tivoli/client/ba/bin/dsm.opt",
    changes => ["set SErvername $tsm::server_name"],
    notify  => Service[$tsm::service_name],
  }

}
