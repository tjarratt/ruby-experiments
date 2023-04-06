class Set
  
  attr_reader :size

  def initialize(capacity = 0)
    @size = 0
    @capcity = capacity
    @storage = Array.new(capacity)
  end

  def empty?
    @size.zero?
  end

  def add(object)
    return if contains?(object)

    grow if full?

    @storage[@size] = object
    @size += 1
  end

  def full?
    @size == @capacity
  end

  def grow
    @capacity = capacity * 2
    bigger = Array.new(@capacity)
    @storage.each { bigger << _1 }
  end

  def index_of(object)
    @size.times do |index|
      return index if @storage[index].eql?(object)
    end

    -1
  end

  def contains?(object)
    return index_of(object) >= 0
  end

  def remove(object)
    index = index_of(object)
    return if index < 0

    @storage[index] = @storage[@size - 1]
    @storage[@size - 1] = nil
    @size -= 1
  end
end
