#!/usr/bin/env ruby

def length_of_longest_substring(s)
  longest = 0
  hash = Hash.new

  chars = s.split('')
  chars.each_with_index do |char, index|
    if hash.key?(char)
      longest = [longest, hash.keys.size].max

      # hash should only include characters between these two indices
      range = (hash[char] + 1)..index

      hash = Hash.new
      chars[range].each_with_index { hash[_1] = _2 + range.first }
    end

    hash[char] = index
  end

  [longest, hash.keys.size].max
end

require 'minitest/autorun'

class TestLengthOfLongestSubstring < MiniTest::Test
  def test_simple
    assert_equal length_of_longest_substring("abcabcbb"), 3
  end

  def test_strange_terminating_case
    assert_equal length_of_longest_substring("dvdf"), 3
  end

  def test_case_255
    assert_equal length_of_longest_substring("yfsrsrpzuya"), 7
  end
end

