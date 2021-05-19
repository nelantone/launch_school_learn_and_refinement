=begin
Madlibs Revisited
Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.

Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

The challenge of this program isn't about writing your program; it's about choosing how to represent your data. Choose the right way to structure your data, and this problem becomes a whole lot easier. This is why we don't show you what the input data looks like; the input representation is your responsibility.

Example output:

The sleepy brown cat noisily
licks the sleepy yellow
dog, who lazily licks his
tail and looks around.
Example text data

The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around.
Example replacement words

adjectives: quick lazy sleepy ugly
nouns: fox dog head leg
verbs: jumps lifts bites licks
adverb: easily lazily noisily excitedly

PEDAC
- Problem understanding:
  - Mental Model:
    - make a program that reads text and plugs random: nouns, verbs, adjetives and adverbs directly.
=end

included_ary = { '%{adjective}' => %w(quick lazy sleepy ugly),
                 '%{noun}' => %w(fox dog head leg cat tail),
                 '%{verb}' => %w(spins bites licks hurdles),
                 '%{adverb}' => %w(easily lazily noisly excitedly) }

def reemplacement(line, included_ary)
  line.split.map do |word|
    init_word  = word
    word, coma = word.partition(',') if word.include?(',')

    if word.start_with?('%{')
      sample = included_ary[word].sample
      word   = init_word.include?(',') ? sample << coma : sample
    end
    word
  end.join(' ')
end

File.open('madlibs.txt') do |file|
  file.each { |line| puts reemplacement(line, included_ary) }
end

# adjective = %w[quick lazy sleepy ugly].sample

# arr = []
# File.readlines("madlib.txt").each do |line|
#   # line = line.gsub('%{adjective}', adjective )
#   p line
# end

# file.gsub('%{adjective}', %w[quick lazy sleepy ugly] )
# p file.read
# module Rand
#   def self.adjective
#     %w[quick lazy sleepy ugly].sample
#   end

#   def self.noun
#     %w[fox dog head leg].sample
#   end

#   def self.verb
#     %w[jumps lifts bites licks].sample
#   end

#   def self.adverb
#     %w[easily lazily noisily excitedly].sample
#   end
# end
