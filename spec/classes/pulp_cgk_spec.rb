#!/usr/bin/env rspec

require 'spec_helper'

describe 'pulp_cgk' do
  it { should contain_class 'pulp_cgk' }
end
