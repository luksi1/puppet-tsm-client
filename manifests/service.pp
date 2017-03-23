#
class tsm::service {
  if !($::tsm::service_ensure in ['running', 'stopped']) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $::tsm::service_manage {
    service { 'dsmcad':
      ensure     => $::tsm::service_ensure,
      enable     => $::tsm::service_enable,
      name       => $::tsm::service_name,
      provider   => $::tsm::service_provider,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
