# Fibonacci Numbers (Last Digit)
# In the previous exercise, we developed a procedural method for computing
# the value of the nth Fibonacci numbers. This method was really fast, computing
# the 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last
# digit of the nth Fibonacci number.

# Examples:

def fib_greater_four_digits_last(nth)
  nth = nth % 10
  first_op = (1.6180339**nth)
  second_op = (-0.6180339**nth)
  ((first_op - second_op) / 2.236067977).round % 10
end

def fibonacci_last(nth)
  return fib_greater_four_digits_last(nth) if nth.to_s.size >= 4
  last_2 = [1, 1]
  count = 0

  while (nth - 3) >= count
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
    count += 1
  end

  last_2.last
end

FIB_PATTERN = '011235831459437077415617853819099875279651673033695493257291'

def fibonacci_last(number)
  pattern_num = number % 60

  FIB_PATTERN[pattern_num].to_i
end

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4
fibonacci_last(123_456_789_987_745) # -> 5

starting = Time.now
fibonacci_last(1_000_007)
ending = Time.now
elapsed = ending - starting
elapsed

#### Further Exploration

# **Final approach**

# I also found out the 60 numbers repetition.
# This is my own version:
# ```ruby
# FIB_PATTERN = '011235831459437077415617853819099875279651673033695493257291'

# def fibonacci_last(number)
#   nth_position = number % 60

#   FIB_PATTERN[nth_position]
# end
# ```
# source: [Fibonacci 60 Code: Spiral Pattern of ReEntry](https://www.jain108.com/fibonacci-60-code/)

# **Initial approach**

# In my first solution I was using Binet's mathematical Formula but just worked well for numbers with more than 4 digits...
# **Binet's Formula** use the *golden number* **Phi=1.6180339** ,  `sqrt5=2.236067977` and  `phi= Phi - 1.0 => -0.6180339`.
# I added `% 10` and worked partially because it didn't work for less digits than 4 so I just refactored the original solution winning few milliseconds using `#while`
# ```ruby
# def fib_greater_four_digits_last(numth)
#   nth = numth % 10
#   first_op = (1.6180339 ** nth)
#   second_op = (-0.6180339 ** nth)
#   ((first_op - second_op) / 2.236067977).round % 10
# end

# def fibonacci_last(numth)
#   return fib_greater_four_digits_last(numth) if numth.to_s.size >= 4
#   last_2 = [1, 1]
#   count = 0

#   while (numth-3) >= count
#     last_2 = [last_2.last , (last_2.first + last_2.last) % 10 ]
#     count += 1
#   end

#   last_2.last
# end
# ```
# source: [Binet's Formula for the nth Fibonacci number] (http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/fibFormula.html)
