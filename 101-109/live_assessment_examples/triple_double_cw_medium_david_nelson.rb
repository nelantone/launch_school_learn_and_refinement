=begin
6 kyu
Write a function

triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0

Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2
=end

=begin
* Problem understanding:
  - Mental model:
    - from two argument passed find triple continuous digit on the first argument, and the same digit double oin the second argument

  - Input: 2 integers

  - Output: integer 1 or 0

  - Rules:
    - Explicit:
        -  returns 1 if there is a straight triple of a number

    - Implicit:
      - there is only. one triple double or 0.
      - in case a double it has 3 continuous digits as the triple, it should return zero(edge case)

* Examples:

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - from the first argument. find a continue digit that is ONLY 3 times present.
      - iterate and save digit
      - create individually from digits in an array and t sort and count the reperitions(tallly)
      - select only the digit that is exaclty 3 time present
    - if there is a continuous  digit 3 times find the continues same number ONLY 2 times(no more than 2 times).
      repeat tally process this time with int2
        - use select to return the key-value if the same triple number, is double in the second argument.
          - if there is not, the hash it will be empty and then we return `0`
          - otherwise we return `1`. A we use guard clauses we can add `1` in the last line as return value of the method 
  - Ideas:

  - Higher Level Algorithm(helper methods):
    - triple?
    - double?

* Code:
=end

def has_triple_d(int)
  tally_d = int.digits.tally
  result  = tally_d.select { |key_num, count_val| count_val == 3 }

  result.keys[0]
end


def triple_double(int1, int2)
  return 0 if has_triple_d(int1).nil?

  triple_number = has_triple_d(int1)
  tally_d       = int2.digits.tally

  result = tally_d.select do |key_num, count_val|
     count_val == 2 && key_num == triple_number
  end

  return 0 if result.empty?
  1
end


# p has_triple_d(666789) == 6
# p has_triple_d(12345) == nil
p triple_double(12345, 12345)      == 0
p triple_double(666789, 12345667)  == 1
p triple_double(666789, 123456667) == 0
p triple_double(6666789, 12345667) == 0