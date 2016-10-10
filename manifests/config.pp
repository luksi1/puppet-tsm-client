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
  } 
 
  $dsm_default_options = {
	'path' => '/opt/tivoli/tsm/client/ba/bin/dsm.sys',
	'ensure' => 'present',
	'multiple' => 'false',
  }

  $lines = {
	'SErvername' => { line => "SErvername $tsm::server_name" },
	'MANAGEDSERVICES' => { line => "MANAGEDSERVICES $tsm::managed_services" },
        'MEMORYEFFICIENTBACKUP' => { line => "MEMORYEFFICIENTBACKUP $tsm::memory_efficient_backup" },
	'COMMMethod' => {line => "COMMMethod $tsm::comm_method" },
        'TCPPort' => {line => "TCPPort $tsm::tcp_port" },
	'TCPServeraddress' => {line => "TCPServeraddress $tsm::tcp_server_address"},
	'PASSWORDACCESS' => {line => "PASSWORDACCESS $tsm::password_access"},
        'SCHEDMODE' => { line => "SCHEDMODE $tsm::sched_mode" },
        'NODENAME' => { line => "NODENAME $tsm::node_name" },
        'DOMAIN' => {line => "DOMAIN $tsm::domain" },
        'TCPCLIENTPORT' => { line => "TCPCLIENTPORT $tsm::tcp_client_port" },
        'HTTPPORT' => { line => "HTTPPORT $tsm::http_port" },
        'TCPWINDOWSIZE' => {line => "TCPWINDOWSIZE $tsm::tcp_window_size" },
        'TCPNODELAY' => {line => "TCPNODELAY $tsm::tcp_no_delay"},
        'RESOURCEUTIL' => {line => "RESOURCEUTIL $tsm::resource_util"},
        'TXNBYTELIMIT' => {line => "TXNBYTELIMIT $tsm::txn_byte_limit" },
        'ERRORLOGNAME' => {line => "ERRORLOGNAME $tsm::error_log_name"},
        'SCHEDLOGNAME' => {line => "SCHEDLOGNAME $tsm::sched_log_name"},
        'SCHEDLOGRET' => {line => "SCHEDLOGRET $tsm::sched_log_ret"},
        'ERRORLOGRET' => {line => "ERRORLOGRET $tsm::error_log_ret"},
        'INCLExcl' => {line => "INCLExcl $tsm::incl_excl"}
  }

  create_resources(file_line, $lines, $dsm_default_options)

  file { '/opt/tivoli/tsm/client/ba/bin/dsm.opt':
    owner => root,
    group => root,
    mode  => '0644',
  } 

}
