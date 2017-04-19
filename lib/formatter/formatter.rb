require_relative '../formatter/default_formatter'

class Formatter
  attr_reader :data, :formatter

  def initialize(data, formatter = DefaultFormatter.new)
    @data = data
    @formatter = formatter
  end

  def print
    formatter.print(data)
  end
end
