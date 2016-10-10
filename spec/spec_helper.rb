require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
  c.default_facts = {
    :hostname => 'foo.domain.com',
    :architecture => 'amd64'
  }
end
