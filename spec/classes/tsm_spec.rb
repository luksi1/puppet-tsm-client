require 'spec_helper'

describe 'tsm' do
  let(:params) do
    {
      server_name: 'foo.domain.com',
    }
  end

  context 'Ubuntu x86_64' do
    let(:facts) do
      {
        osfamily: 'Debian',
        architecture: 'x86_64',
        operatingsystem: 'Ubuntu'
      }
    end

    it { is_expected.to contain_package('tivsm-ba') }
    it { is_expected.to contain_package('tivsm-api64') }
    it { is_expected.to contain_file('/opt/tivoli/tsm/client/ba/bin/inexclude_file') }
    it { is_expected.to contain_file('/opt/tivoli/tsm/client/ba/bin/dsm.opt') }
    it { is_expected.to contain_service('dsmcad').with_ensure('running') }
  end

  context 'RedHat/CentOS x86_64' do
    let(:facts) do
      {
        osfamily: 'RedHat',
        architecture: 'x86_64',
        operatingsystem: 'CentOS'
      }
    end

    it { is_expected.to contain_package('TIVsm-BA') }
    it { is_expected.to contain_package('TIVsm-API64') }
  end

  context 'Suse x86_64' do
    let(:facts) do
      {
        osfamily: 'Suse',
        architecture: 'x86_64',
        operatingsystem: 'SLES'
      }
    end

    it { is_expected.to contain_package('TIVsm-BA') }
    it { is_expected.to contain_package('TIVsm-API64') }
  end
end
