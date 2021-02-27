# (https://www.codewars.com/kata/5c55ad8c9d76d41a62b4ede3/train/ruby)
# 7 kyu
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
=end

=begin
- Problem understanding:
  - mental model: finde the ammount of pairs(each number that is twice add +1
    and see the total).
  - input: integers collection
  - output: integer
  - rules:
    - explicit:
      - array can be empty or with one value (then is 0)
      - max array length is 1000(range is betweeen 0 and 1000)
    - implicit:
      - It can be a repeated number of pairs(no limit abouit it).
- Examples(below)
- Data struct:
 -array?
- Algorithm
  iterate the array collection.
  every time a number is counted twice add +1 and remove the number from the
  list
- Code
=end

def pairs(ary)
  count = 0
  present_nums = []

  ary.each do |num|
    if present_nums.include?(num)
      count += 1
      present_nums.delete(num)
    else
      present_nums << num
    end
  end
  count
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
