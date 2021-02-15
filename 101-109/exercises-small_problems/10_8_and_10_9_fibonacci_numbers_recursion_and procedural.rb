=begin
Fibonacci Numbers (Recursion)
The Fibonacci series is a sequence of numbers starting with 1 and 1 where
each number is the sum of the two previous numbers: the 3rd Fibonacci number
is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on.
In mathematical terms:

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2
Sequences like this translate naturally as "recursive" methods.
A recursive method is one in which the method calls itself. For example:

def sum(n)
  return 1 if n == 1
  n + sum(n - 1)
end

sum is a recursive method that computes the sum of all integers
between 1 and n.

Recursive methods have three primary qualities:

They call themselves at least once.
They have a condition that stops the recursion (n == 1 above).
They use the result returned by themselves.
In the code above, sum calls itself once; it uses a condition of n == 1
to stop recursing; and, n + sum(n - 1) uses the return value of the
recursive call to compute a new return value.

Write a recursive method that computes the nth Fibonacci number,
where nth is an argument to the method.

If you find yourself struggling to understand recursion, see this
forum post. It's worth the effort learning to use recursion.

That said, this exercise is a lead-in for the next two exercises.
It verges on the Advanced level, so don't worry or get discouraged if
you can't do it on your own. Recursion is tricky, and even experienced
developers can have trouble dealing with it.
=end
=begin
- Problem understanding:
  - problem domain:
    - Fibonacci numbers: sequence of numbers starting with 1 and 1 where
        each number is the sum of the two previous numbers
    - Recursion: A recursive method is one in which the method calls itself.
        Recursive methods have three primary qualities:
      - They call themselves at least once.
      - They have a condition that stops the recursion (n == 1 above).
      - They use the result returned by themselves.
  - mental model: Write a recursive method that computes the nth Fibonacci
    number, where nth is an argument to the method.
  - input: number
  - output: number
  - rules:
    - explicit:
      - we need to use recursive method(and )
      - sequence of numbers starting with 1
    - implicit:
- Examples(below):
- Data Structure:
  Maybe an array, not sure if it's a need.
- Algorithm:
  start adding the most basic examples and the easy result without recursion
  - add the first number and save the result as new value for the next iteration
    let's start from there...
- Code:
=end

def fibonacwci(nth)
  return 1 if nth == 1 || nth == 2

  fibonacci(nth - 1) + fibonacci(nth - 2)
end

# Examples:

fibonacci(1) == 1 # starting with one
fibonacci(2) == 1 # 0 + (1) = (1)
fibonacci(3) == 2 # 1 + (1) = (2)
fibonacci(4) == 3 # (1) + (2) = (3) The key! As fibonacci(1) + fibonacci(2) = 3
fibonacci(5) == 5 #  (2) + (3) = 5
fibonacci(6) == 8 #  (3) + (5) = (8)
fibonacci(7) == 8 #  (5) + (8) = 13
fibonacci(12) == 144
fibonacci(20) == 6765

# Fibonacci Numbers (Procedural)
# In the previous exercise, we developed a recursive solution to calculating
# the nth Fibonacci number. In a language that is not optimized for recursion,
# some (not all) recursive methods can be extremely slow and require massive
# quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion, but it isn't designed
# for heavy recursion; as a result, the Fibonacci solution is only useful up to
# about fibonacci(40). With higher values of nth, the recursive solution is
# impractical. (Our tail recursive solution did much better, but even that
# failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a non-recursive
# (procedural) method.

# Rewrite your recursive fibonacci method so that it computes its results
# without recursion.

=begin
Problem understanding
  ... same as before
  - rules:
    - explicit:
      - don't use recursive method
      - sequence of numbers starting with 1
  ... same as before
=end

# Examples:

def fibonacci(nth)
  fibonacci = [1, 1]

  3.upto(nth) { fibonacci[1] = fibonacci[-1] + fibonacci.shift }

  fibonacci.last
end

# or
# def fibonacci(nth)
#   fibonacci = [0,1]

#   0.upto(nth - 2) { fibonacci << fibonacci[-1] + fibonacci[-2] }

#   fibonacci.last
# end

fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

starting = Time.now
fibonacci(100)
ending = Time.now
elapsed = ending - starting
elapsed
