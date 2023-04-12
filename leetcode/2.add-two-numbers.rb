#!/usr/bin/env ruby

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def to_s
    parse_reversed_number(self)   
  end
end

def add_two_numbers(l1, l2)
  to_list(parse_reversed_number(l1) + parse_reversed_number(l2))
end

def to_list(number)
  node = nil
  prev = nil
  number.to_s.split('').each do |n|
    node = ListNode.new(n, prev)
    prev = node
  end

  return node
end

def parse_reversed_number(linked_list)
  string = ""
  node = linked_list

  while node do 
    string << node.val 
    node = node.next 
  end

  string.reverse.to_i
end

puts add_two_numbers(
  ListNode.new('2', ListNode.new('4', ListNode.new('3'))),
  ListNode.new('5', ListNode.new('6', ListNode.new('4')))
).val
