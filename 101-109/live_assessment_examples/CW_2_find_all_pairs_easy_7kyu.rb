=begin
Find all pairs

You are given array of integers, your task will be to count all pairs in that
array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once.
E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is
between 0 and 1000
Examples

[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

* Problem understanding:
  - Problem domain:

  - Mental model:

  - Input:

  - Output:

  - Rules:
    - Explicit:

    - Implicit:

  - Questions:

* Examples:

* Data Structure:
    -

* Algorithm:
  - Main Algorithm:

  - Ideas:

  - Higher Level Algorithm(helper methods):

* Code:
=end

def count_same_digits(ary)
  ary.each_with_object({}) do |char, result|
     result[char].nil? ? result[char] = 1 : result[char] += 1
  end
end

p count_same_digits([1, 2, 5, 6, 5, 2])

def pairs(ary)
  count_same_digits = count_same_digits(ary)
  count_same_digits.values.map {|b| b / 2 }.sum
  # ary.tally.values.map {|b| b / 2 }.sum
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0