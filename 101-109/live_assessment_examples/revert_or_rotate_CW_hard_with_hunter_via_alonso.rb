=begin
Reverse or rotate?
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size `sz`).
If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.
If:
`sz` is <= `0` or if `str` is empty return `""`
`sz` is greater (>) than the length of str it is impossible to take a chunk of size sz hence return `""`
=end

=begin
* Problem understanding:
  - Problem domain:
    - chunk: substring

  - Mental model:
      -cut the input into substrings
        - if substrign represent an integrer and sum of the cubes of its digits is divisible by 2(mod % 2)
          reverse that substring
        - otherwise rotate to the left by one possition.
      put together these modified substr and return the result as a string.

  - Input: str and integer

  - Output: str

  - Rules:
    - Explicit:
      -
    - Implicit:
      - chunk/suibstring needs to as size with no reminder.
        substr size = 4, firest arg  size 18, output size 16
        (zero reminder)
  - Questions:
    - many, next question

* Examples:
  rev  rot  rot  rot
  5630 0065 5734 4694 # initial           85
  0365 0650 7345 6944 # result
      "5600"

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    +  Divide the first agrument in n size substrings(with the secong argument size) and create an array of these substrings
    +  From each substring teach each digit transform it into integer and make the digit cubed
    + sum the result of all cubed elements (sum_cubed)
    - if the result `sum_cubed` is divisible by 2 reverse the substring
      - otherwise rotate it to the left by one position

  - Ideas:

  - Methods
    - fancy:
    - not-fancy:

  - Higher Level Algorithm(helper methods):
    + ary string generator

* Code:
=end

# If a substring represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; 

def ary_str_gen(str, size)
  subary = str.chars.each_slice(size).to_a.select {|sub_ary| sub_ary.size == size }
  subary.map(&:join)
end

def divisable_by_2?(str)
  nums = str.chars
  nums.map{|num| num.to_i ** 3}.sum % 2 == 0
end

# `sz` is <= `0` or if `str` is empty return `""`
# `sz` is greater (>) than the length of str it is impossible to take a chunk of size sz hence return `""`
def revrot(str, size)
  return '' if  size.zero? || size > str.size || str.empty?
  substrings = ary_str_gen(str, size)

  substrings.map do |substr|
     divisable_by_2?(substr) ? substr.reverse : substr.chars.rotate.join
  end.join
end

p revrot("5630", 4) == "0365"
p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("123456779", 0) == ""
p revrot("1234", 5) == ""
p revrot("", 8) == ""

p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("563000655734469485", 4) == "0365065073456944"


# p divisable_by_2?("5630") == true

# p ary_str_gen("563000655734469485", 4) == %w(5630 0065 5734 4694)
# "5630 0065 5734 4694"


# For anyone having issues understanding the below paragraph:

# If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2,

# reverse that chunk; otherwise rotate it to the left by one position. Put together these modified
# chunks and return the result as a string.

# Each digit on a chunk needs to be cubed, then sum all those digits:

# Chunk example: 73304

# Number  Cubed
# 7  343
# 3  27
# 3  27
# 0  0
# 4  64
# Total  461
# 461 is not divisible exactly by 2, so(explanation is really messed up, I don't know what left means in the original description, maybe meant the other left):
# Send first digit to the back:
# 73304 => 33047

# If it is divisible exactly by 2, reverse chunk:
# 73304 => 40337

# Hopefully this makes more sense to you guys.