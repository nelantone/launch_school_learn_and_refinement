# A Narcissistic Number is a positive number which is the sum of its own digits, each raised to the power of the number of digits in a given base. In this Kata, we will restrict ourselves to decimal (base 10).

# For example, take 153 (3 digits), which is narcisstic:

#     1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
# and 1652 (4 digits), which isn't:

#     1^4 + 6^4 + 5^4 + 2^4 = 1 + 1296 + 625 + 16 = 1938
# The Challenge:

# Your code must return true or false depending upon whether the given number is a Narcissistic number in base 10.

# Error checking for text strings or other invalid inputs is not required, only valid positive non-zero integers will be passed into the function.

=begin
* Problem understanding:
  - Problem domain:
      Narcissistic Number:
        +num which is the sum of all digits individually
        and reised to the power of the nummber of digits.

  - Mental model:
    -  cwe want to return true or false depending upon whether the given number is a Narcissistic number(true) or not(false) in base 10.

  - Input: integer

  - Output: boolean

  - Rules:
    - Explicit:
      - it can't be more than 10 digits
      - The power of the number is the number of digits

    - Implicit:
      -  we sum all digits and result should be same as the given integer to be narcissistic

  - Questions: it is important the base 10 fact? No with this examples.

* Examples:

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - result array
    - from the given number we want to convert it into and string
    - the stirng size in value called `power`
    - then take each char of the string and iterate
      - convert the char into integer and use power **
        totoal =elem ** power
      - append the total into `reslut_array`
    - whe we have all the totals, do the `sum` of the totals
    - and we compare the total to the given argument
    - if i s true is narcissistic, otherwise false

  - Higher Level Algorithm(helper methods):

* Code:
=end

def narcissistic?(num)
  result_ary = []
  str_num = num.to_s
  power = str_num.size

  return true if power == 1

  str_num.each_char do |char|
    result_ary << char.to_i**power
  end

  result_ary.sum == num
end

p narcissistic?(5) == true
p narcissistic?(153)  == true
p narcissistic?(1633) == false
p narcissistic?(1652) == false

# 20`
# total 45`, assesment passed.
