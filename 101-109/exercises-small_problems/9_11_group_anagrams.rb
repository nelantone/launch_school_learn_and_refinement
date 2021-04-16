# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
# 'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
# 'flow', 'neon']

# Write a program that prints out groups of words that are anagrams. Anagrams
# are words that have the same exact letters in them but in a different order.
# Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
# (etc)...

=begin
* Problem understanding:
  - Problem domain:
    -Anagrams:  are words that have the same exact letters in them but in
    a different order.

  - Mental model:
    we want to do array-groups of words with the same possible combinations
    characters inside a word-string.

  - Input: an array

  - Output: nil (output of arrays of strings)

  - Rules:
    - Explicit:
      - the groups of words need to have exactly the same characters in size
      and number.

    - Implicit:
      -

  - Questions:
      - single words with no combination should not be part of the output?
       - NO, for now...
* Examples:
 words =  ['demo', 'dome', 'mode', 'live', 'mod', 'demoo'] -> ["demo", "dome", "mode"]

* Data Structure:
    - arrays

* Algorithm:
  - Main Algorithm:

  - Ideas:
      - sort all elements converting them into individual chars and joind them.
      - if the sorted chars are equal add them into a n array
      - select the ones that are equal and on the same time not uniq

  - Higher Level Algorithm(helper methods):

* Code:
=end

words1 =  ['demo', 'dome', 'mode', 'live', 'mod', 'demoo']
words2 =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
           'flow', 'neon']

def group_same_char_words(ary)
  ary.group_by { |str| str.chars.sort.join }
end

# same as group by
# def group_same_char_words(ary)
#   ary.group_by { |str| str.chars.sort.join }
# results = {}

# ary.select do |str|
#   sorted_char_str = str.chars.sort.join

#   if results[sorted_char_str].nil?
#     results[sorted_char_str] = [str]
#   else
#     results[sorted_char_str] << str
#   end
# end
# results
# end

def find_anagrams(hash_candidates)
  hash_candidates.values.select { |candidates_ary| candidates_ary.size > 1 }
end

def group_anagrams(ary)
  anagram_candidates = group_same_char_words(ary)
  nested_anagrams = find_anagrams(anagram_candidates)
  nested_anagrams.each { |group_anagram| p group_anagram }
end

group_anagrams(words1) == [["demo", "dome", "mode"]]
# => ["demo", "dome", "mode"]
group_anagrams(words2) == [["demo", "dome", "mode"], ["none", "neon"],
                           ["tied", "diet", "edit", "tide"],
                           ["evil", "live", "veil", "vile"],
                           ["fowl", "wolf", "flow"]]
# =>  ["demo", "dome", "mode"]
# ["none", "neon"]
# ["tied", "diet", "edit", "tide"]
# ["evil", "live", "veil", "vile"]
# ["fowl", "wolf", "flow"]
