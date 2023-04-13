class CArray
  attr_accessor :capacity

  def initialize(capacity)
    @capacity = capacity
    @storage = Array.new
  end

  def []=(index, element)
    if index >= @capacity
      raise Exception.new("Tried to add to array at index #{index} above capacity #{capacity}")
    end

    @storage[index] = element
  end

  def [](index)
    @storage[index]
  end
end
