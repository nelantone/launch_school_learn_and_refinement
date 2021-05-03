# Simple Simple Simple String Expansion (from Codewars)
# Given a string that includes alphanumeric characters ('3a4B2d') return
#the expansion of that string: The numeric values represent the occurrence
#of each letter preceding that numeric value. There should be no numeric
#characters in the final string. Empty strings should return an empty string.
# The first occurrence of a numeric value should be the number of times each
#character behind it is repeated, until the next numeric value appears.

=begin
* Problem understanding:
  - Mental model:
    return the char respreented by n times the characters on the right.
      2a=> aa
      3abc => aaabbbccc

  - Input: str

  - Output: str

  - Rules:
    - Explicit:
      - empty string or string woth no integrer included then return the same str

    - Implicit:
     - first char is an integer when we need to transform the array
     - when there is one intger N and many chars on the left then we repat each char continuosly N times

  - Questions:

* Examples:

* Data Structure:
    - array?

* Algorithm:
  - Main Algorithm:
    - guard clause, if the first char is not an integer

    return the integer itself
    - initialize a new result array
    - create an array of chars and iterate
      - intialize a multiplier * 1
      - multiply * 1 until  we found ot a new integer as char. then we reassign it to the new inter.
      - if there are continue intgeres us the last one.
        - array of integers and take the last*
      - take as reference and count the amount of chars that are not integers and make a new substrign with
      -  3 'ab' 'a' * 3
                'b' * 3
      -  store the results in result_array

  - Higher Level Algorithm(helper methods):

* Code:
=end

def integer_and_not_zero?(str)
  !str.to_i.zero?
end


def string_expansion(str)
  result = ''
  multip = 1

  str.chars do |char|
    if integer_and_not_zero?(char)
       multip = char.to_i
    else
      result << char * multip
    end
  end
  result
end

p string_expansion('3D2a5d2f') == 'DDDaadddddff'
p string_expansion('3abc') == 'aaabbbccc'
p string_expansion('3d332f2a') == 'dddffaa'
p string_expansion('abcde') == 'abcde'
p string_expansion('abcd2e') == 'abcdee'
p string_expansion('') == ''