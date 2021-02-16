# Longest Sentence

# Write a program that reads the content of a text file and then prints the
#  longest sentence in the file based on number of words. Sentences may end
# with periods (.), exclamation points (!), or question marks (?).
# Any sequence of characters that are not spaces or sentence-ending characters
# should be treated as a word. You should also print the number of
# words in the longest sentence.

# Example text:

# Copy Code
# Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal.

# Now we are engaged in a great civil war, testing whether
# that nation, or any nation so conceived and so dedicated,
# can long endure. We are met on a great battlefield of that
# war. We have come to dedicate a portion of that field, as
# a final resting place for those who here gave their lives
# that that nation might live. It is altogether fitting and
# proper that we should do this.

# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract. The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.
# The longest sentence in the above text is the last sentence;
# it is 86 words long. (Note that each -- counts as a word.)

# Another Example

# Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt,
# and run your program on this file.

# The longest sentence in this book is 157 words long.

=begin
- Problem understanding:
  - mental model: print the longes sentence from a file based on number of words
    also print the number of words in the longest sentence.
  - input: string
  - ouput: print string with longest sentence and the number of words
  - rules:
    - explicit:
      - sentences end in (`.`!`,`?`)
      - any sequence chars  that are not spaces or sentence-ending chars
        are treated as a word.
    - implicit:
      - empty lines (jumps) are ignored
      - each new line it is shown as \n, it should count as space

- Examples (above)
- Data structure:
  - nested array
- Algorithm:
  - Initialize `text` With `File.read` refering to sample_text.txt file
  - initialize a new variable `sentences` reference to the return value of
    the string split for each of the next chars (`.`,`!`,`?`) as an array
    collection.
  - from `each` sentence split each space and count the number of chars.
  - find the biggest char with `max`.
  - print the biggest char with the number of total chars.
- Code:
=end
text = File.read('sample_text.txt')

sentences_ary      = text.split(/[.!?]/)
sentence_words_ary = sentences_ary.map(&:split)
max_sentence_words = sentence_words_ary.max_by(&:size)

puts max_sentence_words.join(' '), "Containing #{max_sentence_words.size} words"
puts "-" * 10
puts "-" * 10
# Further Exploration
# You may have noticed that our solution fails to print the period at the
# end of the sentence. Can you write a solution that keeps the period printed
# at the end of each sentence?

# What about finding the longest paragraph or longest word? How would we
# go about solving that problem

text = File.read('sample_text.txt')
text = text.gsub(/[.]/, '.!')

max_sentence_words = text.split(/[!?]/).map(&:split).max_by(&:size)
longest_word       = text.split(/[^a-z]/i).max_by(&:size)
longest_pharagraph = text.split(/.!\n/).max_by(&:size).gsub('.!', '.')

puts "Longest sentence:"
puts max_sentence_words.join(' ').to_s
puts "| Containing #{max_sentence_words.size} words"
puts "*" * 10
puts "Longest word: #{longest_word}"
puts "| Containing #{longest_word.size} words"
puts "*" * 10
puts "Longest pharagraph:"
puts longest_pharagraph.to_s
puts "| Containing #{longest_pharagraph.size} words"
puts "*" * 10
