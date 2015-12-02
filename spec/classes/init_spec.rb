require 'spec_helper'
describe 'cleanup1' do

  context 'with defaults for all parameters' do
    it { should contain_class('cleanup1') }
  end
end
