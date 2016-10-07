require 'spec_helper'

describe 'tsm', :type => :class  do
  let :facts do
    {
      :hostname => 'client.domain.com',
      :osfamily => 'Debian',
      :operatingsystem => 'Ubuntu',
      :architecture => 'x86_64'
    }
  end
  let(:server_name) {'foo'}
  let(:tcp_server_address) {'tsm_server.domain.com'}
  context 'should compile' do
    it { should compile }
  end

  context 'should contain tivsm-ba' do
    it {is_expected.to contain_package("tivsm-ba")}
  end
  context 'should contain tivsm-api64' do
    it {is_expected.to contain_package("tivsm-api64")}
  end
end

