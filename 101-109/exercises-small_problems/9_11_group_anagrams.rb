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


# Write a program that prints out groups of words that are anagrams.
# Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

=begin
* Problem understanding:
  - Problem domain:
    - anagrams: words with same chars in different order
  - Mental model:
    - given a collection of word/strings, group the anagrams in an array.

  - Input: array

  - Output: array(nested)

  - Rules:
    - Explicit:
      - we only want to return the anagrams

    - Implicit:
      - group anagrams in subarrays
      - at lest need to be 2 anagrams in the subarray
  - Questions:

* Examples:
    'none', 'neno' -> ['neno','none']
    'none', 'neno', 'hey' -> ['neno','none']
* Data Structure:
    - array
    - hash

* Algorithm:
  - Main Algorithm:
      - iterate to all elements in the array
      - and from each element sortall the chars inside
      - find the anagram candidates and use them as a reference/key
      - when are the same chars add them into a new array
      - append the subarrays into a new array
      - then return the subarrays that at laest have 2 elements

  - Ideas:

  - Apporach:
    + initialize result ary
    + init a candidates_to_anagram
    + init anagrams_hash
    + iterate the given array
    + from each element create an array of each char
    + sort it.
    + append each sorted char into candidates_to_anagram
    + find the uniq elements
    + add this uniq elements as key**
    + init the keys canagram_candidate and values as an array
    + iterate again from the given array store
    + append each element with sorted chars that is the same of the key to the specific key
    - using the anamgram hash select only the value size greatrer than 1
    - return the keys of this selection

  - Higher Level Algorithm(helper methods):
   - sort_chars *?

* Code:
=end

# def candidates_anagram(ary)
#   result = []
#   ary.each do |word|
#     sorted_word = word.chars.sort
#     unless result.include? sorted_word
#       result << sorted_word
#     end
#   end
#   result.map(&:join)
# end
#
# canidates_anagram = candidates_anagram(ary)

def anagrams(ary)
  anagrams_hash = {}

  ary.each do |word|
    sorted_word = word.chars.sort.join

    if anagrams_hash[sorted_word].nil?
      anagrams_hash[sorted_word] = [word]
    else
      anagrams_hash[sorted_word] << word
    end
  end

  anagrams_hash = anagrams_hash.select {|anagram_candiate, words_array| words_array.size > 1 }
  anagrams_hash.values
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# ["demo", "dome", "mode"]
# ["neon", "none"]
# ["tied", "diet", "edit", "tide"]
# ["evil", "live", "veil", "vile"]
# ["fowl", "wolf", "flow"]

pp anagrams(words)# == [["demo", "dome", "mode"]
                   #["neon", "none"]...]
