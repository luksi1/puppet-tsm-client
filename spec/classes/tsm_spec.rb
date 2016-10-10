require 'spec_helper'

describe 'tsm', :type => :class  do
  let(:server_name) {'foo'}
  let(:tcp_server_address) {'tsm_server.domain.com'}

  context 'Ubuntu should compile and contain correct packages' do
    let(:facts) {{:osfamily => 'Debian' }}
    it { should compile }
    it {is_expected.to contain_package("tivsm-ba")}
    it {is_expected.to contain_package("tivsm-api64")}
  end

  context 'RedHat should compile and contain correct packages' do
    let(:facts) {{:osfamily => 'RedHat' }}
    it { should compile }
    it {is_expected.to contain_package("TIVsm-BA")}
    it {is_expected.to contain_package("TIVsm-API64")}
  end

  context 'Suse should compile and contain correct packages' do
    let(:facts) {{:osfamily => 'Suse' }}
    it { should compile }
    it {is_expected.to contain_package("TIVsm-BA")}
    it {is_expected.to contain_package("TIVsm-API64")}
  end

end

