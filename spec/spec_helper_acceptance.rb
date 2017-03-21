require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'

module_name = "mule"

hosts.each do |host|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  # we want to get puppet 3.x from the local repo. this will need to be changed.
  # plus this only works on Ubuntu
  on host, 'apt-get -y install puppet'
  install_package(host, 'git')
end

UNSUPPORTED_PLATFORMS = ['RedHat','Suse','windows','AIX','Solaris']

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  c.before :suite do
    hosts.each do |host|
      scp_to(host, proj_root, '/etc/puppet/modules/' + module_name)
      # problems with .gitlab-ci runner cloning in the actual module name, instead of the correct one
      on host, 'mv /etc/puppet/modules/*' + module_name + '*' + '/etc/puppet/modules/' + module_name, { :acceptable_exit_codes => [0,1,2] }
      on host, puppet('module','install','puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
    end
  end
end
