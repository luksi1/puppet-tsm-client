require 'spec_helper'

describe 'tsm' do
  context 'Ubuntu x86_64 should contain the correct packages' do
    let(:facts) do
      {
        osfamily: 'Debian',
        architecture: 'x86_64',
      }
    end

    it { is_expected.to contain_package('tivsm-ba') }
    it { is_expected.to contain_package('tivsm-api64') }
  end

  context 'RedHat x86_64 contain the correct packages' do
    let(:facts) do
      {
        osfamily: 'RedHat',
        architecture: 'x86_64',
      }
    end

    it { is_expected.to contain_package('TIVsm-BA') }
    it { is_expected.to contain_package('TIVsm-API64') }
  end

  context 'Suse x86_64 contain the correct packages' do
    let(:facts) do
      {
        osfamily: 'Suse',
        architecture: 'x86_64',
      }
    end

    it { is_expected.to contain_package('TIVsm-BA') }
    it { is_expected.to contain_package('TIVsm-API64') }
  end

  context 'logs files should be created' do
    let(:facts) do
      {
        osfamily: 'Debian',
        architecture: 'x86_64',
      }
    end

    it { is_expected.to contain_file('/opt/tivoli/tsm/client/ba/bin/inexclude_file') }
    it { is_expected.to contain_file('/opt/tivoli/tsm/client/ba/bin/dsm.opt') }
  end

  context 'services should be started' do
    let(:facts) do
      {
        osfamily: 'Debian',
        architecture: 'x86_64',
      }
    end

    it { is_expected.to contain_service('dsmcad').with_ensure('running') }
  end
end
