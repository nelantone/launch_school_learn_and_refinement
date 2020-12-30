=begin
Write a method that searches for all multiples of 3 or 5 that lie between 1 and
some other number, and then computes the sum of those multiples. For instance,
if the supplied number is 20, the result should be
  98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

PEDAC
P
- Problem domain: multiples.
- rules:
 - searches for all multiples of 3 or 5 that lie between 1 and
some other number and then computes the sum of those multiples.
- explicit
  - input: number
  - output: number
- implicit? /
- clarifying questions:/
- mental model:/

E
 20, the result should be
  98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
Data struc:
array to store different numbers to add

A
init an empty array
iterate from 0 to num.
add cond operators to select 3 and 5 multiples.
add multiples in empty array.
sum multiples. return result of the sum.

C

=end

def multisum(upper_num)
  range = (0..upper_num)

  multiples = range.select do |num|
    num % 3 == 0 || num % 5 == 0
  end

  multiples.sum
end

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

=begin
Write a method that takes an Array of numbers, and
returns an Array with the same number of elements,
and each element has the running total from the
original Array.
=end

def running_total(array)
  array.map.with_index { |_, index| array[0..index].sum }
end
#or
def running_total(ary)
  sum = 0
  ary.map { |num| sum += num }
end

#or
def running_total(ary)
  ary.each_with_object([]) { |value, array| (value + array.last.to_i)}
end

#or this nice one
def running_total(arr)
  arr.inject([]) { |arr, n| arr << (arr.last.to_i + n) }
end


running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []