require 'minitest/autorun'
require_relative 'set'

class TestSet < MiniTest::Unit::TestCase
  def setup
    @empty = Set.new
    @one = Set.new
    @many = Set.new

    @one.add("1")
    @many.add("1")
    @many.add("2")
  end

  def test_emptiness
    assert @empty.empty? == true
    assert @one.empty? == false
    assert @many.empty? == false
  end

  def test_size
    assert @empty.size == 0
    assert @one.size == 1
    assert @many.size > 1 
  end

  def test_contains
    assert @empty.contains?("1") == false
    assert @empty.contains?("2") == false
    assert @one.contains?("1") == true
    assert @one.contains?("2") == false
    assert @many.contains?("1") == true
    assert @many.contains?("2") == true
  end

  def test_remove
    set = Set.new
    set.add("1")
    set.add("2")
    set.add("3")
    set.add("4")

    set.remove("2")
    set.remove("not in the set")

    assert set.size == 3
    assert set.contains?("2") == false

    assert set.contains?("1") == true
    assert set.contains?("3") == true
    assert set.contains?("4") == true
  end

  def test_ignores_duplicates
    @one.add("1")

    assert @one.size == 1
  end

  def test_grows_when_full
    set = Set.new(1)

    set.add("1")
    set.add("2")

    assert set.size == 2
    assert set.contains?("1")
    assert set.contains?("2")
  end
end

