#
class tsm::config inherits tsm {

  file { $::tsm::incl_excl:
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { $::tsm::log_dir:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0666',
  } ->
  file { $::tsm::error_log_name:
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0666',
  } ->
  file { $::tsm::sched_log_name:
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0666',
  }
  
  concat { "${::tsm::dsm_sys_file}.puppet":
    ensure_newline => true,
  } ~> exec {'copy_dsm_sys':
    command => "${::tsm::copy_path} ${::tsm::dsm_sys_file}.puppet $::tsm::dsm_sys_file"
  }

  file { '/opt/tivoli/tsm/client/ba/bin/dsm.opt':
    owner   => root,
    group   => root,
    mode    => '0644',
    content => $::tsm::opt_server_name,
  } 

}
