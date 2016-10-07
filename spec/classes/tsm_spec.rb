require 'spec_helper'

describe 'tsm', :type => :class  do
  let(:facts) {{:hostname => 'my_client'}}
  let(:server_name) {'foo'}
  let(:tcp_server_address) {'tsm_server.domain.com'}
  context 'should compile' do
    it { should compile }
  end
end

