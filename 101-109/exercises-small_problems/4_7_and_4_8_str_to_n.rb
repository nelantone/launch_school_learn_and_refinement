=begin
The String#to_i method converts a string of numeric characters (including an
optional plus or minus sign) to an Integer. String#to_i and the Integer
constructor (Integer()) behave similarly. In this exercise, you will create a
method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate
number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about
invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to
convert a string to a number, such as String#to_i, Integer(), etc. Your method
should do this the old-fashioned way and calculate the result by analyzing the
characters in the string.

PEDAC

Problem understanding
- Prob domain:
- explicit:
  - input: string of digits
  - output: number
- implicit
- rules:
 do not use:
  #to_s
  #Integer()
- clarify questions
- mental model
Examples/tests

string_to_integer('4321') == 4321
string_to_integer('570') == 570
Data stucture:
probably a hash collection.

Algorithm
create a hash with the numbers from '0' to '9' as key and 0 to 9 as value
take each element of the string and look for the spefific key. Once
it find the key add it into a new array
join the arraz elements in only one and extract the one element in the array

Code
=end

# str_num_to_num = {}
# ('0'..'9').map.with_index { |str_num, index| str_num_to_num[str_num] = index }

NUMBERS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str_num)
  ary_str_num = str_num.split('')

  ary_str_num.map!.with_index do |key, index|
    num = NUMBERS[key]
    10**((ary_str_num.size) - (index + 1)) * num
  end

  ary_str_num.sum
end

string_to_integer('4321') == 4321
string_to_integer('570') == 570

=begin
extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number
as an integer. The String may have a leading + or - sign; if the first character
is a +, your method should return a positive number; if it is a -, your method
should return a negative number. If no sign is given, you should return a
positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such
as String#to_i, Integer(), etc. You may, however, use the string_to_integer
method from the previous lesson.
=end

def string_to_signed_integer(str_num)
  str_num.delete!('+') if str_num.start_with?('+')

  if str_num.start_with?('-')
    str_num.delete!('-')
    return string_to_integer(str_num) * (-1)
  end

  string_to_integer(str_num)
end

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
