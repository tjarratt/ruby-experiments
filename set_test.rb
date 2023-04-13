require 'minitest/autorun'
require_relative 'set'

class TestSet < MiniTest::Test
  def setup
    @empty = Set.new
    @one = Set.new
    @many = Set.new

    @one.add("1")
    @many.add("1")
    @many.add("2")
  end

  def test_emptiness
    assert_equal true,  @empty.empty?
    assert_equal false, @one.empty?
    assert_equal false, @many.empty?
  end

  def test_size
    assert_equal 0, @empty.size
    assert_equal 1, @one.size
    assert_equal true, @many.size > 1
  end

  def test_contains
    assert_equal false, @empty.contains?("1")
    assert_equal false, @empty.contains?("2")
    assert_equal true, @one.contains?("1")
    assert_equal false, @one.contains?("2")
    assert_equal true, @many.contains?("1")
    assert_equal true, @many.contains?("2")
  end

  def test_remove
    set = Set.new

    set.add("1")
    set.add("2")
    set.add("3")
    set.add("4")

    set.remove("2")
    set.remove("not in the set")

    assert_equal 3, set.size
    assert_equal false, set.contains?("2")
    assert_equal true, set.contains?("1")
    assert_equal true, set.contains?("3")
    assert_equal true, set.contains?("4")
  end

  def test_uniqueness
    @one.add("1")

    assert_equal 1, @one.size
  end

  def test_grows_when_full
    set = Set.new(1)

    set.add("1")
    set.add("2")

    assert_equal 2, set.size
    assert_equal true, set.contains?("1")
    assert_equal true, set.contains?("2")
  end
end

