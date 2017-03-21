#
class tsm::install inherits tsm {
  if $::tsm::package_manage {
    package { $::tsm::tivsm_ba_package: ensure => $::tsm::tivsm_ba_package_ensure, }
    package { $::tsm::tivsm_api_package: ensure => $::tsm::tivsm_api_package_ensure, }

  }

}
