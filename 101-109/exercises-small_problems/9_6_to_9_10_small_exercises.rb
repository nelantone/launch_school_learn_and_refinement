# How long are you?
# Write a method that takes a string as an argument, and returns an Array that
# contains every word from the string, to which you have appended a space and
# the word length.

# You may assume that words in the string are separated by exactly one space,
# and that any substring of non-space characters is a word.

# Examples

def word_lengths(str)
  str.split.map { |word| "#{word} #{word.size}" }
end

word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

# Name Swapping
# Write a method that takes a first name, a space, and a last name passed as
# a single String argument, and returns a string that contains the last name,
# a comma, a space, and the first name.

# Examples
def swap_name(str)
  str.split.reverse.join(', ')
end

swap_name('Joe Roberts') == 'Roberts, Joe'

# Sequence Count
# Create a method that takes two integers as arguments. The first argument is
# a count, and the second is the first number of a sequence that your method
# will create. The method should return an Array that contains the same number
# of elements as the count argument, while the values of each element will be
# multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or
# greater, while the starting number can be any integer value. If the count
# is 0, an empty list should be returned.

# Examples:

def sequence(count, start_num)
  count.times.map { |cnt| (cnt + 1) * start_num }
end

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

# Grade book
# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.

# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'

# Tested values are all between 0 and 100. There is no need to check for
# negative values or values greater than 100.

# Example:

def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3

  return '+A' if average >= 101

  case average
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  when 0..59   then 'F'
  end
end

get_grade(-1, -2, -2) == "A"
get_grade(50, 50, 95) == "D"
get_grade(100, 103, 105) == "+A"

# Grocery List
# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

# Example:

def buy_fruit(list)
  list.each_with_object([]) { |fr, ary| fr.last.times { ary << fr.first } }
end

# Or better and more descriptive  following ***clarity over terseness principle***

def buy_fruit(list)
  list.each_with_object([]) do |fruit, list_result|
    quantity = fruit[1]
    fruit = fruit[0]

    quantity.times { list_result << fruit }
  end
end

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
