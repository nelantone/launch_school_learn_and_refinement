=begin
https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby


Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:

greatest_product("123834539327238239583") // should return 3240


# LONG
=begin
* Problem understanding:
  - Mental model:
    - find max product result of 5 consecutive numbers

  - Input: string

  - Output: number/int

  - Rules:
    - Explicit:
      - five consec digits

  - Questions:

* Examples:


* Data Structure:
    - array/integers

* Algorithm:
  - Main Algorithm:
    + init result
    + create an array of integer elements
    + use each cons
    + transform each ary to digits
    + reduce(:*) return the prod of each array
    + return the max number from the result array

  - Ideas:

  - Apporach:

  - Higher Level Algorithm(helper methods):

* Code:


 sub_strs = []
- Get all of the 5 digit substrings
  - Get the length of the given string and subtract 5 from it (initialize a variable last_slice to store it)
  - loop last_slice times
    - slice the given string from current num 5 digits and append the result in sub_strs
["string1", 'string2', etc]

- initialize a products varaible to the return value of:
  - loop through all the substrings and transform
    - coerce each substring to the integer version
      - iterate through the chars (digits) and for each digit (transform with map)
        return the digit.to_i
    - sub_string.digits.inject(:*)

products = [1234, 2345, etc]

products.max

=end
# Ben solution
# def greatest_product(str)
#   sub_strs = []
#   last_slice = str.length - 4
#   last_slice.times do |num|
#     sub_strs << str.slice(num, 5)
#   end

#   product = sub_strs.map do |substr|
#     substr.chars.map { |char| char.to_i }.inject(:*)
#   end
#   product.max
# end

# other solution
# def greatest_product(str)
#   sub_arrays = str.chars.each_cons(5).to_a

#   sub_arrays.map! do |sub_ar|
#     sub_ar.map! {|ele| ele.to_i}

#     sub_ar.reduce(:*)
#   end.max
# end

# my solution
def greatest_product(str_n)
  result = []
  str_n.chars.each_cons(5) do |con_ary|
    result << con_ary.map(&:to_i).reduce(:*)
  end
  result.max
end


p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0