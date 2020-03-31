#
class tsm::config inherits tsm {

  file { $::tsm::incl_excl:
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat { "${::tsm::dsm_sys_file}.puppet":
    ensure_newline => true,
  }

  exec {'copy_dsm_sys':
    command     => "${::tsm::copy_path} ${::tsm::dsm_sys_file}.puppet ${::tsm::dsm_sys_file}",
    subscribe   => Concat["${::tsm::dsm_sys_file}.puppet"],
    refreshonly => true,
  }

  file { '/opt/tivoli/tsm/client/ba/bin/dsm.opt':
    owner   => root,
    group   => root,
    mode    => '0644',
    content => "SERVERNAME ${::tsm::server_name}",
  }

}
