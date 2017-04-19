class DefaultOrderer
  def order(data, attribute)
    data.sort { |x, y| x.send(attribute) <=> y.send(attribute) }
  end
end
