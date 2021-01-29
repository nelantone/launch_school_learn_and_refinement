# Sum of Sums
# Write a method that takes an Array of numbers and then returns the sum
# of the sums of each leading subsequence for that Array. You may assume
# that the Array always contains at least one number.

# Examples:
=begin
-Problem understanding:
 - input: array of nums
 - output: number
 - rules:
  - array contains at least one number
- Example (below)
- data structure:
  - array
- Algorithm:
  - add a new array
  - add the first number
  - add the second and first number
  accumulate each number in the quantity and save the result
- code:
=end

def sum_of_sums(ary)
  ary.map.with_index { |_, index| ary[0..index].sum }.sum
end

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

# Madlibs
# Mad libs are a simple game where you create a story template with blanks
# for words. You, or another player, then construct a list of words and place
# them into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an
# adverb, and an adjective and injects those into a story that you create.

# Example
puts "Enter a noun:"
noun = gets.chomp

puts "Enter a verb:"
verb = gets.chomp

puts "Enter an adjective:"
adjective = gets.chomp

puts "Enter an adverb:"
adverb = gets.chomp

sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb} ? That's hilarious!"
sentence_2 = puts "#{noun}! I #{verb} to you! why you are so #{adverb}? you are so #{adjective}.."
sentence_3 = puts "He it is Mr.#{adverb} #{adjective} #{verb}, you don't do it as a #{noun}"

puts [sentence_1, sentence_2, sentence_3].sample

# Leading Substrings
# Write a method that returns a list of all substrings of a string that start
# at the beginning of the original string. The return value should be arranged
# in order from shortest to longest substring.

# Examples:

def leading_substrings(string)
  index_size = string.size - 1

  (0..index_size).map { |idx| string.chars[0..idx].join('') }
end

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
