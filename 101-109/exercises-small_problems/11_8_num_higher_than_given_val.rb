# Next Featured Number Higher than a Given Value
# A featured number (something unique to this exercise) is an odd number that
# is a multiple of 7, and whose digits occur exactly once each. So, for example,
# 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not
# a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the
# next featured number that is greater than the argument. Return an error
# message if there is no next featured number.

=begin
- Problem understanding:
  - mental model: write a method that takes an integer and returns the next
  featured number greater than the argument. Return an error when there is no
  next featured number
  - input: integer
  - output: integer or raise an excception
  - rules & problem domain:
    - explicit:
      - Featured number:
        - odd number
        - multiple of 7
        - digits occurr only once(133 not)
    - implicit:
      - all numbers input/output are integers
      - numbers with more than 7 digits are returned with undescore every
        3 digits
- Examples below.
- Data Structure:
  - array
- Algorithm:
  - find the next number divisible by 7 starting from the specific number.
  - use the featured number as base and add 7 to this number.
    - with the new number
      - see if is an odd number. no, +7
      - yes: conver it to string and heck if the numbers are uniq(size should
        be the same with or without #uniq), no +7
      - if the number complete all these conditions is a featured number.
- Code:
=end
def featured(integer)
  num = integer + 1

  if num.to_s.size >= 10
    return "There is no possible number that fulfills those requirements"
  end

  until num % 7 == 0 && num.odd? && num.to_s.chars.uniq.size == num.to_s.size
    num += 1
  end
  num
end

# Examples
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987
featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
