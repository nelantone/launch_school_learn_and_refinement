# fizzbuzz
# Write a method that takes two arguments: the first is the starting number,
# and the second is the ending number. Print out all numbers between the two
# numbers, except if a number is divisible by 3, print "Fizz", if a number
# is divisible by 5, print "Buzz", and finally if a number is divisible by 3
# and 5, print "FizzBuzz".

=begin
- Problen understanding:
1 start number, 1 ending num,
print all nums.
if num % 3 & num % 5 "FizzBuzz"
if num % 3 "Fizz"
if num % 5 "Buzz"
  - input
  - output
  - rules
- E
- D
  -range
- A
  - use a range from the start num(num_1)  tillthe end num(num_2)

- C
=end

# Example:

def fizzbuzz(init_num, end_num)
  result = (init_num..end_num).map do |num|
    if (num % 3 == 0) && (num % 5 == 0) then "Fizzbuzz"
    elsif  num % 3 == 0 then "Fizz"
    elsif  num % 5 == 0 then "Buzz"
    else   num
    end
  end
  p result.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
