require 'spec_helper'
require_relative '../../../lib/formatter/formatter'

RSpec.describe Formatter do
  before(:each) do
    @formatter = Formatter.new('blah')
  end
  describe 'initialize' do
    it 'initializes data' do
      expect(@formatter.data).to eql('blah')
    end

    it 'initializes formatter to default formatter' do
      expect(@formatter.formatter.class).to eql(DefaultFormatter)
    end
  end

  describe 'print' do
    it 'invokes print for specified formatter' do
      expect(@formatter.formatter).to receive(:print).with('blah')
      @formatter.print
    end
  end
end
