require 'minitest/autorun'
require_relative 'string_calculator'

class TestCalculator < MiniTest::Test
  def test_zero
    assert_equal(calculate(""), 0)
  end

  def test_single_digit
    assert_equal(calculate("666"), 666)
  end

  def test_simple_sums
    assert_equal(calculate("1,2"), 3)
    assert_equal(calculate("2,2"), 4)
    assert_equal(calculate("10,0"), 10)
  end

  def test_support_unknown_amount_of_numbers
    assert_equal(calculate("1,1,1,1,1,1"), 6)
  end

  def test_support_newlines
    assert_equal(calculate("1\n2,3"), 6)
  end

  def test_custom_delimter
    assert_equal(calculate("//;\n1;2"), 3)
  end

  def test_no_negatives
    err = assert_raises(Exception) { calculate("-1") }
    assert_equal(err.message, "negatives not allowed : -1")
  end

  def test_no_negatives_error_message
    err = assert_raises(Exception) { calculate("-1,-2,-3") }
    assert_equal(err.message, "negatives not allowed : -1, -2, -3")
  end

  def test_ignores_big_numbers
    assert_equal(calculate("2,1001"), 2)
  end

  def test_long_custom_delimiters
    assert_equal(6, calculate("//[***]\n1***2***3"))
  end
end

