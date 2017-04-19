require 'spec_helper'
require_relative '../../../lib/sorter/sorter'

RSpec.describe Sorter do
  before(:each) do
    @sorter = Sorter.new('blah', 'attr')
  end
  describe 'initialize' do
    it 'initializes data' do
      expect(@sorter.data).to eql('blah')
    end

    it 'initializes attribute' do
      expect(@sorter.attribute).to eql('attr')
    end
    it 'initializes orderer to default orderer' do
      expect(@sorter.orderer.class).to eql(DefaultOrderer)
    end
  end

  describe 'sort' do
    it 'invokes sort for specified orderer' do
      expect(@sorter.orderer).to receive(:order).with('blah', 'attr')
      @sorter.sort
    end
  end
end
