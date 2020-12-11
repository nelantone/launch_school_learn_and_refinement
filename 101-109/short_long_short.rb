=begin
Write a method that takes two strings as arguments, determines the longest of
the two strings, and then returns the result of concatenating the shorter string,
the longer string, and the shorter string once again. You may assume that the
strings are of different lengths.
PEDAC
- Problem understanding: Have time tu process and understand the problem
  - Problem domain: Is the area of expertise of the problem. It is important
    to see if we fool understand the concepts/key words.
  - implicit requirements(make them explicit):
     strings should be of different lengths * not asking forvalidation so far
  - Explicit requirements:
    - input: 2 strings
    - output: 1 string(concatenation form the 2 strings in a new one)
  - rules: strings should be of different lengths
  - clarify questions: Do we need to validate that the strings are different size?
  - mental model:
- Examples and test: find examples/tests about the expected input/output and
  find edge cases.
    short_long_short('abc', 'defgh') == "abcdefghabc"
    short_long_short('abcde', 'fgh') == "fghabcdefgh"
    short_long_short('', 'xyz') == "xyz"
- Data structure: Add the kind of data structure we are going to use to solve
  the problem.

- Algorithm (The steps to follow to solve the problem with our own words or
  also more structures as pseudocode).
  size the two arguments.
  initialize a new array
  take first the smallest size argument and concatenate it to the new array
  take the other argument and concatenate it on the array
  take again the smallest argument and concatenate it
  merge all object strings in one object string composed by all the 3 objects
  in one on the same order as first object first merge.
- Code: Algorithm implementation.
=end

def short_long_short(string1, string2)
  if string1.size > string2.size
    string2 + string1 + string2
  elsif string1.size < string2.size
    string1 + string2 + string1
  else
    "the strings are same size, please try again with different sized stings"
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
p short_long_short('xyz', 'xyz') == "the strings are same size, please try again with different sized stings"