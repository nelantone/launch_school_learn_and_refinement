=begin
Fibonacci Number Location By Length
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
 such that the first 2 numbers are 1 by definition, and each subsequent number
 is the sum of the two previous numbers. This series appears throughout the
 natural world.

Computationally, the Fibonacci series is a very simple series, but the results
grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
354,224,848,179,261,915,075 -- that's enormous, especially considering that
it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci
number that has the number of digits specified as an argument. (The first
Fibonacci number has index 1.)

PEDAC
Problem understanding:
The idea is tho know the digit size of a fibonacci number
problem domain:
fibonacci calculation, how do we calculate a fibonacci number?
  n =	0	1	2	3	4	5	6	7	  8	  9   10
 xn =	0	1	1	2	3	5	8	13	21	34	55

 as we see fibonacci is just adding the n-1 number plus n-2 number.
 there is a special formula, with the golden ratio.
 golden ratio: every n, n-1 number ratio(division) is `1.618034`
 it means :
 n/n-1 = 1.618034

 using the golden ratio(φ=PHI) we can calculate the numbers with this formula and round
 the result.
  where n is the number that we want to know the fibonacci sequence related.
  for 6.
 n=6
 PHI(golden ratio) = 1.618034

 (6-1) * PHI= 8.09017 rounded 8..

Examples/test(below)

Data structure:
integer as input and output. Does not seem that we need any arrya,hash etc...
Maybe just a helper method

Algorithm:
- take the integer input
- calculate the fibonacci number

- transform it to string
- use #size or #length method on the caller
Code:

=end

# def fibonacci_number_seq(number)
#   return number if number <= 1
#   fibonacci_number_seq(number-2) + fibonacci_number_seq(number-1)
# end

# def find_fibonacci_index_by_length(number_digits)
#   fibonacci_sequence = []
#   index = 0

#   loop do
#     index +=1
#     fibonacci_sequence << fibonacci_number_seq(index)
#     break if (fibonacci_number_seq(index).to_s.size  <=> number_digits ) == 0
#   end

#   fibonacci_sequence.length
# end

# fibonacci_number_seq(0) # 0
# fibonacci_number_seq(1) # 1
# fibonacci_number_seq(2) # 1
# fibonacci_number_seq(3) # 2
# fibonacci_number_seq(4) # 3
# fibonacci_number_seq(5) # 5
# fibonacci_number_seq(6) # 8
# fibonacci_number_seq(10) # 8

## This solution is possible but it is to slow and find_fibonacci_index_by_length(10)
# already take so much time because I was using recursion.
# Lesson learned, understand recursion but do not use recursion or avoid it as
# much as possible.

# The next one it is better and without recursion

def find_fibonacci_index_by_length(number_of_digits)
  fibo_order = [1, 1]

  loop do
    fibo_order << (fibo_order[-1] + fibo_order[-2])
    break if (fibo_order.last.to_s.size <=> number_of_digits) == 0
  end

  fibo_order.length
end

find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

start = Time.now
find_fibonacci_index_by_length(10000) == 47847
finish = Time.now
