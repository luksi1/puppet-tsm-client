require 'spec_helper'

describe 'tsm', :type => :class  do

  context 'Ubuntu x86_64 should contain the correct packages' do
    let(:facts) {{:osfamily => 'Debian', :architecture => 'x86_64' }}
    it {is_expected.to contain_package("tivsm-ba")}
    it {is_expected.to contain_package("tivsm-api64")}
  end

  context 'RedHat x86_64 contain the correct packages' do
    let(:facts) {{:osfamily => 'RedHat', :architecture => 'x86_64' }}
    it {is_expected.to contain_package("TIVsm-BA")}
    it {is_expected.to contain_package("TIVsm-API64")}
    it {should contain_file('/opt/tivoli/tsm/client/ba/bin/dsm.sys').with_content("NODENAME foo")}
  end

  context 'Suse x86_64 contain the correct packages' do
    let(:facts) {{:osfamily => 'Suse', :architecture => 'x86_64' }}
    it {is_expected.to contain_package("TIVsm-BA")}
    it {is_expected.to contain_package("TIVsm-API64")}
    it {should contain_file('/opt/tivoli/tsm/client/ba/bin/dsm.sys').with_content("NODENAME foo")}
  end

  context 'logs files should be created' do
    let(:facts) {{:osfamily => 'Debian', :architecture => 'x86_64', :hostname => 'foo' }}
    it { is_expected.to contain_file('/opt/tivoli/tsm/client/ba/bin/inexclude_file') }
    it { is_expected.to contain_file('/opt/tivoli/tsm/client/ba/bin/dsm.opt') }
  end

  context 'services should be started' do
    let(:facts) {{:osfamily => 'Debian', :architecture => 'x86_64' }}
    it { is_expected.to contain_service('dsmcad').with_ensure('running') }
  end

end

