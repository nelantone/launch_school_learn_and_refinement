=begin
In this kata, you must create a digital root function.

A digital root is the recursive sum of all the digits in a number. Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.

Here's how it works:

digital_root(16)
=> 1 + 6
=> 7

digital_root(942)
=> 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6

digital_root(132189)
=> 1 + 3 + 2 + 1 + 8 + 9
=> 24 ...
=> 2 + 4
=> 6

digital_root(493193)
=> 4 + 9 + 3 + 1 + 9 + 3
=> 29 ...
=> 2 + 9
=> 11 ...
=> 1 + 1
=> 2


p digital_root(16) == 7
p digital_root(num) == 6
p digital_root(493193) == 2
p digital_root(132189) == 6
p digital_root(942) == 6
=end
=begin
* Problem understanding:
  - Mental model:
    sum all given digits  and sum over until there is only one digit

  - Input: integer

  - Output: integer

  - Rules:
    - Explicit:
      - sum the num until there is only one digit 

    - Implicit:

  - Questions:

* Examples:

digital_root(942)
=> 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6


* Data Structure:
    - aray

* Algorithm:
  - Main Algorithm:
      - take each digit add to each other until we only have oned digit left

  - Ideas:
    - using chars and use sume of teach element in the array

  - Methods to use:
    - Basic methods:

    - Direct methods:

  - Apporach:
    + trnasform the num into str
    + thransform to chars
    + transform each char to integer
    + do the sum of the array
    + transform the result inot string
      - if the sting size is eql 1 return
      - otherwise repeat

  - Higher Level Algorithm(helper methods):
    - add sum of digits 
    - root
    
* Code:
=end
# def sum_of_digits(num)
#   num.to_s.chars.map(&:to_i).sum
# end

# def digital_root(num)
#   until num.to_s.size == 1
#     num = sum_of_digits(num)
#   end
#   num
# end


# def digital_root(input)
#   loop do 
#     input = input.digits.sum

#     break if input.to_s.size == 1
#   end
#   input
# end

def digital_root(num)
  return num if num.to_s.length <= 1 # base case
  num = num.digits.sum
  digital_root(num) # recursive case
end

# p sum_of_digits(16)

num = 456

def digital_root(num)
  # loop do
    return num if num.digits.size == 1
    num = num.digits.sum
  # end
end


def digital_root(num)
  return num if num.to_s.length <= 1 # base case
  num = num.digits.sum
#   digital_root(num) # recursive case
end


p digital_root(16) == 7
p digital_root(num) == 6
p digital_root(493193) == 2
p digital_root(132189) == 6
p digital_root(942) == 6

p num

# new zoom link: https://us02web.zoom.us/j/88394746486?pwd=bENZOWZpMFdaellOdXgyTHNRNjh0UT09

