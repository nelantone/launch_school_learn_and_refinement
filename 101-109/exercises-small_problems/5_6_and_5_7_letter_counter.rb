=begin
Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

PEDAC:
P
mental model:
we want a result counting the number of words inside a string.
there is no special way to sort the numbers we count the amount of times
this size is present

input: string
output: hash

rules:
- Words consist of any string of characters that do not include a space:
  in `what's`,`fiddle!` and `doc?` all are considered words

clarify doubts: no special to sort (see last example)

E

D+A:
- we initialize a hash
- then use split in every space the string in different objects inside an array
- iterate in our array
- we call size on each element as key and we initialize the key,value in case
  doesn't exitst
- if exist we add +1 to the value evey time we have the same key.
- the result array is our result.

C
=end

def word_sizes(string)
  word_size_counts = Hash.new(0)
  size_words = string.split.map(&:size)

  size_words.each { |word_size| word_size_counts[word_size] += 1 }

  word_size_counts
end

# with `#tally`

def word_sizes(string)
  string.split.map(&:size).tally
end

# Examples
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}

# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size.
# For instance, the length of "it's" is 3, not 4.

# new examples

# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}

def filter_chars(string)
  string.split.map { |word| word.scan(/[a-zA-Z]/).join }
end

def word_sizes(string)
  word_size_counts = Hash.new(0)
  size_words = filter_chars(string).map(&:size)

  size_words.each { |word_size| word_size_counts[word_size] += 1 }

  word_size_counts
end

# with `#tally` using  `#filter_word`s helper method.

def word_sizes(string)
  filter_chars(string).split.map(&:size).tally
end
