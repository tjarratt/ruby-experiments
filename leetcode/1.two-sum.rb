#!/usr/bin/env ruby

# def two_sum(numbers, target)
#   numbers.each_with_index do |x, index_x|
#     numbers.each_with_index do |y, index_y|
#       break if numbers.size > 250 && (x + y) > target && target.positive?
#       next if index_x == index_y
#       return [index_x, index_y] if (x + y) === target
#     end
#   end
# end

def two_sum(numbers, target)
  lookup = numbers.each_with_index.reduce(Hash.new) do |hash, arr| 
    hash[arr.first] ||= [] 
    hash[arr.first] << arr.last
    hash
  end

  numbers.each_with_index do |n, index|
    indices = lookup[target - n]
    next unless indices

    indices.each do |other_index|
      next if index == other_index
      return [index, other_index]
    end
  end
end

puts two_sum([2,7,11,15], 9).inspect
puts two_sum([3,2,4], 6).inspect
puts two_sum([3, 3], 6).inspect
puts two_sum([2,1,9,4,4,56,90,3], 8).inspect

