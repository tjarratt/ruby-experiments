#!/usr/bin/env ruby

# desired run-time complexity O(log (m+n))

def find_median_sorted_arrays(nums1, nums2)
  nums2.each { nums1 << _1 }
  nums1.sort!

  middle = (nums1.size - 1) / 2.0
  (nums1[middle.floor] + nums1[middle.ceil]) / 2.0
end

require 'minitest/autorun'

class TestMedianOfSortedArrays < MiniTest::Test
  def test_simple_cases
    assert_equal 2, find_median_sorted_arrays([1,3], [2])
    assert_equal 3, find_median_sorted_arrays([1,3], [2,4,5])
    assert_equal 2.5, find_median_sorted_arrays([1,2], [3,4])
  end
end

