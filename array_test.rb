require 'minitest/autorun'
require_relative 'array'

class TestArray < MiniTest::Test
  def test_add_and_retrieve
    array = CArray.new(1)

    array[0] = "hello world"

    assert_equal "hello world", array[0]
  end

  def test_capacity
    array = CArray.new(1)
    bigger = CArray.new(100)

    assert_equal 1, array.capacity
    assert_equal 100, bigger.capacity
  end

  def test_cannot_allocate_more_memory_to_grow
    array = CArray.new(1)

    assert_raises(Exception) { array[1] = "whoopsie" }
    assert_raises(Exception) { array[100_000] = "gross error" }
  end
end

