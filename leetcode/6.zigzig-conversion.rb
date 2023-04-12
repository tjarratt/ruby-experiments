#!/usr/bin/env ruby

def convert(s, num_rows)
  magic = [num_rows * 2 - 2, 1].max
  num_columns = (s.size / magic.to_f).ceil

  num_rows.times
          .map { (_1 == 0 || _1 == num_rows - 1) ? map_once(s, num_columns, magic, _1) : map_twice(s, num_columns, magic, _1) }
          .flatten
          .join('')
end

def map_once(s, num_columns, magic, which)
  num_columns.times.map { s[_1 * magic + which] }
end

def map_twice(s, num_columns, magic, which)
  num_columns.times.map do 
    [
      s[_1 * magic + which], 
      s[_1 * magic + (magic - which)]
    ] 
  end
end



require 'minitest/autorun'

class TestZigZagConversion < MiniTest::Test
  def test_simple
    assert_equal "PAHNAPLSIIGYIR", convert("PAYPALISHIRING", 3)
    assert_equal "PINALSIGYAHRPI", convert("PAYPALISHIRING", 4)
  end

  def test_pathological
    assert_equal "A", convert("A", 1)
  end
end

# note that we can go across the top by looking at each (len * 2 - 2)th charcters
# eg in PAYPALISHIRING and three rows we read indices 0, 4, 8, 12 giving P A H N
#
# Question : how do I generate these indices in the correct order ?
# Question : how many columns do we have in total ? 

## TWO ROWS (magic is 3)
#============
# P  P L S
# A Y A I


## THREE ROWS (magic is 4)
# ===========
# P   A   H   N (column_num * magic + 0)
# A P L S I I G (column_num * magic + 1) and (column_num * magic + 3)
# Y   I   R     (column_num * magic + 2)

## FOUR ROWS (magic is 6)
# ==========
# P     I    N (column_num * magic + 0)
# A   L S  I G (column_num * magic + 1) and (column_num * magic + 5)
# Y A   H R    (column_num * magic + 2) and (column_num * magic + 4)
# P     I      (column_num * magic + 3)


# FIVE ROWS (magic is 8)
# =========
# A    I     
# B   H J    
# C  G   K   
# D F     L  
# E        M 

