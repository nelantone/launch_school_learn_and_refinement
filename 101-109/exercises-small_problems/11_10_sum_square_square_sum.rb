# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n
# positive integers.

# Examples:
=begin
- Problem understaning
  - Mental model:
    - return teh difference between square of the sim of the firs n positive
      integers and the sum of the squares of the first n positive integers.
    - input: integer
    - output:integer
    - rules:
      - explicit:
        - are all positive `n` numbers
      - implicit:/
- Examples(Below)
- Data Structure:
  - range or array
- Algorithm:
  -  initialize an array/or range from 1 to `n` where n is the input
  -  add all the n numbers and multiply per 2.
  - use the same collection and these time multiply per two each element
  - substract from first result - second result and return the result
- Code:
=end

def sum_square_difference(n)
  sum_square = 0.upto(n).sum**2
  square_sum = 0.upto(n).map { |num| num**2 }.sum

  sum_square - square_sum
end

sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150
