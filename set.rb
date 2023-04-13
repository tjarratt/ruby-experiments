require_relative 'array'

class Set

  def initialize(capacity = 10)
    @size = 0
    @capacity = capacity
    @storage = CArray.new(capacity)
  end

  def empty?
    @size == 0
  end

  def add(element)
    return if contains?(element)
    grow! if full?

    @storage[@size] = element
    @size += 1
  end

  def full?
    @size == @capacity
  end

  def grow!
    bigger = CArray.new(@size * 2)
    for index in 0..@size do
      bigger[index] = @storage[index]
    end
    @storage = bigger
  end

  def size
    @size
  end

  def index_of?(element)
    for index in 0..@size do
      return index if @storage[index].eql?(element)
    end

    return -1

  end

  def contains?(element)
    index_of?(element) >= 0
  end

  def remove(element)
    return unless contains?(element)

    index = index_of?(element)
    @storage[index] = @storage[@size - 1]
    @storage[@size - 1] = nil
    @size -= 1
  end
end
