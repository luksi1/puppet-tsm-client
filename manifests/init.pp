# Class: tsm
class tsm (
  String $server_name                                  = undef,
  String $node_name                                    = $::hostname,
  Optional[String] $managed_services                   = 'WEBCLIENT SCHEDULE',
  Optional[Enum['yes', 'no']] $memory_efficient_backup = 'yes',
  Optional[Enum['TCPip', 'SHAREdmem']] $comm_method    = 'TCPip',
  Optional[Integer] $tcp_port                          = 1500,
  Optional[String] $password_access                    = 'generate',
  Optional[String] $sched_mode                         = 'POLLING',
  Optional[Array] $domain                              = ['ALL-LOCAL'],
  Optional[Integer] $tcp_client_port                   = 1501,
  Optional[Integer] $http_port                         = 1581,
  Optional[Integer] $tcp_window_size                   = 63,
  Optional[Enum['yes', 'no']] $tcp_no_delay            = 'no',
  Optional[Integer] $resource_util                     = 5,
  Optional[Integer] $txn_byte_limit                    = 25600,
  Optional[String] $log_dir                            = '/var/log',
  Optional[String] $error_log_name                     = '/var/log/tsm/err.log',
  Optional[String] $sched_log_name                     = '/var/log/tsm/sched.log',
  Optional[Integer] $sched_log_ret                     = 30,
  Optional[Integer] $error_log_ret                     = 30,
  Optional[String] $incl_excl                          = '/opt/tivoli/tsm/client/ba/bin/inexclude_file',
  Optional[Enum['running', 'stopped']] $service_ensure = 'running',
  Optional[Boolean] $service_enable                    = true,
  Optional[String] $service_name                       = 'dsmcad',
  Optional[String] $service_provider                   = undef,
  Optional[Boolean] $service_manage                    = true,
  Optional[Boolean] $package_manage                    = true,
  Optional[String] $gskcrypt_package                   = $::tsm::params::gskcrypt_package,
  Optional[String] $gskcrypt_package_ensure            = 'latest',
  Optional[String] $gskssl_package                     = $::tsm::params::gskssl_package,
  Optional[String] $gskssl_package_ensure              = 'latest',
  Optional[String] $tivsm_ba_package                   = $::tsm::params::tivsm_ba_package,
  Optional[String] $tivsm_ba_package_ensure            = 'latest',
  Optional[String] $tivsm_api_package                  = $::tsm::params::tivsm_api_package,
  Optional[String] $tivsm_api_package_ensure           = 'latest',
  Optional[String] $dsm_sys_file                       = '/opt/tivoli/tsm/client/ba/bin/dsm.sys',
  Optional[String] $dsm_opt_file                       = '/opt/tivoli/tsm/client/ba/bin/dsm.opt',
  Optional[String] $copy_path                          = $::tsm::params::copy_path,
  Optional[Array] $ld_library_path                     = ['/usr/local/ibm/gsk8_64/lib64','/opt/tivoli/tsm/client/api/bin64']
) inherits ::tsm::params {

  anchor { 'tsm::begin': }
  -> class { '::tsm::install': }
  -> class { '::tsm::config': }
  ~> class { '::tsm::service': }
  -> anchor { 'tsm::end': }

}
