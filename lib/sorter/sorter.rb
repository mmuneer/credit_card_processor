require_relative '../sorter/default_orderer'

class Sorter
  attr_reader :data, :attribute, :orderer

  def initialize(data, attr, orderer = DefaultOrderer.new)
    @data = data
    @attribute = attr
    @orderer = orderer
  end

  def sort
    orderer.order(data, attribute)
  end
end
