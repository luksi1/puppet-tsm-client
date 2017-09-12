require 'spec_helper'

describe 'tsm::server', :type => :define do
  let :pre_condition do
    'class { "tsm": server_name => "GOTHENBURG" }'
  end
  let(:title) {'GOTHENBURG'}
  context 'with default parameters' do
    let(:params) {{
      :tcp_server_address => 'backup.domain.com'
    }}
    let(:node) { 'foo.domain.com' }
    let(:facts) {{
      :hostname     => 'foo',
      :osfamily     => 'Debian',
      :architecture => 'x86_64'
    }}
    it { is_expected.to compile }
    it do
      should contain_concat__fragment('tsm_sys_file_GOTHENBURG').with({
        :target => '/opt/tivoli/tsm/client/ba/bin/dsm.sys.puppet'
      })
    end
  end
end
