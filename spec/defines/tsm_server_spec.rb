require 'spec_helper'

describe 'tsm::server' do
  let :pre_condition do
    'class { "tsm": server_name => "GOTHENBURG" }'
  end

  let(:title) { 'GOTHENBURG' }

  context 'with default parameters' do
    let(:params) do
      {
        tcp_server_address: 'backup.domain.com',
      }
    end

    let(:node) { 'foo.domain.com' }

    let(:facts) do
      {
        hostname: 'foo',
        osfamily: 'Debian',
        architecture: 'x86_64',
      }
    end

    it { is_expected.to compile }
    it do
      is_expected.to contain_concat__fragment('tsm_sys_file_GOTHENBURG').with(
        target: '/opt/tivoli/tsm/client/ba/bin/dsm.sys.puppet',
      )
    end
  end
end
