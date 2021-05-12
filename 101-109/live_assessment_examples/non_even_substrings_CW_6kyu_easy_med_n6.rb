# 6 kyu
=begin
Given a string of integers, return the number of odd-numbered substrings that
can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a
total of 7 numbers.

solve("1341") = 7. See test cases for more examples.
=end

=begin
* Problem understanding:
  - Mental model:
    given a string of integers, return the quantity as integer  of the formed
    substrings(converted in number) that are odd.

  - Input: string

  - Output: integer as total of odd num combinations

  - Rules:
    - Explicit:
        - we only want count an return the `n` only odd-numbered substring size.
    - Implicit:
        - we have in the examples non-empty-strings. We don't need think about it
        - numbers need to be sorted the same way (left to right) we can't change
          the order(as reverse etc..)so for "1341", we can't create/add '31'.

  - Questions:

* Examples:

* Data Structure:
    - array of str-numbers
* Algorithm:
  - Main Algorithm:
    - initialize an array result
    - create all possible substrings combination with 1...n(string size) char
      and convert each element to integer and check if is odd.
       -when example. '13','34','41'... 2 chars 3 substr-combinations
        in size 4 str. 2 * 2.
        - when example '134', '341'...3 chars, 2 substr in size 4.
        - IF the substring is an odd number add it to the result.
        - ELSE  jump to the next char.
    - once we find all combinations return the array_result.size
  - Ideas:
    - Find all possible combinations with the numbers.
       finding number size 1(as one char) to `x` as the full string chars.

  - Higher Level Algorithm(helper methods):

* Code:
=end

# def solve(str_digits)
#   result = []

#   1.upto(str_digits.size) do |sub_str_size|
#     str_digits.chars.each_cons(sub_str_size) do |comb|
#       result << comb.join if comb.join.to_i.odd?
#     end
#   end
#   result.size
# end

## My second try version (fancy methods and easy to read)

def solve(str_digit)
  odd_numbers = []

  (1..str_digit.size).each do |size|
    str_digit.chars.each_cons(size) do |con|
      odd_numbers << con.join.to_i if con.join.to_i.odd?
    end
  end
  odd_numbers.size
end

# def solve(str_num)
#   substrings = get_all_substrings(str_num)
#   substrings.select { |substring| substring.to_i.odd? }.count
# end

## Jenae version (pragmatic, creative and short)

# def solve(string)
#   odd_subs = 0
#   string.chars.each_with_index do |char, index|
#     odd_subs += index + 1 if char.to_i.odd?
#   end
#   odd_subs
# end


p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

# 30` JIT
# 30` JIT too
# ?
# R1: 5-10` distractions (pendign to add few things in algorithm)
# R2: almost same result.
# R3: find a solution without using `each_cons`
