=begin
Create a method that takes a positive integer number and returns the next
bigger number formed by the same digits:
12 => 21
513 => 531
2017 => 2071
# If no bigger number can be composed using those digits, return -1:

9 => -1
111 => -1
531 => -1
=end

#  p next_bigger_num(23465) == 23645

=begin
* Problem understanding:
  - Mental model:
    - return the NEXT positive integer number bigger the the positive given number
      passsed as an argument formed by the same digits.

  - Input: positive integer

  - Output: positve number or -1(in case is not possible)

  - Rules:
    - Explicit:
       - argument is a positive integer
       - return  -1(in case is not possible to form next bigger number with same digits)

    - Implicit:
      - we start the next bigger number from right to left.
      - the next one is formed changing the order of the last two digits.
        from the last two digits
      -

  - Questions: /

* Examples:
  - good so far with the given examples
    23465 => 23456 is smaller
    - now we do it taking the last 2 elements ignoring the last.
    - 23465 => 23546, this should be true?

* Data Structure:
    - array
    - string converted in the end to the result number

* Algorithm:
  - Main Algorithm:
    - transform the given integer into a string.
    - reverse the last 2 digits.
    - transform the result into an integer
    - compare and see if the result is bigger than original.
      - if is bigger than the original return this number
      - otherwise try taking 3 digits

  - Ideas:
   - we can use `<=>` to compare

  - Higher Level Algorithm(helper methods):

* Code:
=end

def next_bigger_num(int)
  str_rev = int.to_s

  return -1 if str_rev.size == 1
  return str_rev.reverse.to_i if int.to_s.size == 2

  (int.to_s.size - 1).downto(2).each do |index|
    str_rev[index], str_rev[index-1] = str_rev[index-1], str_rev[index]

    if str_rev.to_i >= int
      return str_rev.to_i
    end
  end
  -1
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
p next_bigger_num(23465) == 23546