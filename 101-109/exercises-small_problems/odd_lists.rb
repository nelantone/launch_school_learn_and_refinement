=begin
PEDAC
- Problem understanding
Write a method that returns an Array that contains every other element of an
Array that is passed in as an argument. The values in the returned list
should be those values that are in the 1st, 3rd, 5th, and so on elements
of the argument Array.

  - problem domain: ordinal(1st,2nd...) and cardinal numbers(0,1,2,3)
  - explicit:
    - input: array
    - output: array
  - implicit input/output? /
  - rules: returned list should be those values that are in the 1st, 3rd, 5th,
    and so on
  - mental model:
   we want to see from the arguments the odd (index cardinal values +1= ordinal)
- Examples & test
  oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
  oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
  oddities(['abc', 'def']) == ['abc']
  oddities([123]) == [123]
  oddities([]) == []

- Data Structure
  arrays and we will need tu use index of the input array for the output
- Algorithm
  we intialize the array_result
  we take the array variable input and we iterate over it with an index number.
  We only take the inxex+1 when iss odd and we save it in a new result array
- Code
=end

def oddities(array)
  array_result = []
  array.map.with_index { |item, idx| array_result << item if (idx + 1).odd? }
  array_result
end

def oddities2(array)
  odd_index = (1..array.size).select(&:odd)
  odd_index.map { |idx| array[idx - 1] }
end

# The winner is:
def oddities3(arr)
  arr.select.with_index { |_, index| index.even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

p oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities2(['abc', 'def']) == ['abc']
p oddities2([123]) == [123]
p oddities2([]) == []

p oddities3([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities3(['abc', 'def']) == ['abc']
p oddities3([123]) == [123]
p oddities3([]) == []
