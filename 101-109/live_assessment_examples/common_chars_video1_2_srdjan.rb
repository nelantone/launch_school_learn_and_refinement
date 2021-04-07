# Given an array of strings made only from lowercase letters, return an array
# of all characters that show up in all strings within the given array
# (including duplicates). For example, if a character occurs 3 times in all
# strings but no 4 times, you need to include that character three times in
# the final answer.

=begin
* Problem understanding:
  - Mental model:
    given an array of lowercase-letter-strings return an array of all chars
    that are present on all elements, the chars can be and need to be shown
    the x times that are present, so, include duplicaters (if `hh` is present
    twice in all needs to be returned ['h','h'...]).

  - Input: array of string words

  - Output: array of single chars

  - Rules:
    - Explicit:
      - all chars are downcased.
      - can be duplicated x time chars in the result if appear duplicated
        x times in all elements.
      - in case there is no char present in all elements then should retrun an
        empty array.

    - Implicit:

  - Questions:

* Examples:

* Data Structure:
    - array of chars/ maybe a hash?
* Algorithm:
  - Main Algorithm:
    - initialize a new result array.
    - convert all stirng elements inside the collection to an array of chars
    - we use tally to find out the chars an amount of times that are present
    - iterate the rest of sub-arrays
      - make a nested iteration, this time of the chars.
        - select the chars that are included in the base array.
  - Ideas:
    - have a base string(for example the first).
    - find all chars present and count them in a hash.
    - make a list of all chars that appear compare if all are present.

  - Higher Level Algorithm(helper methods):

* Code:
=end
def all_uniq_chars(all_chars, key_char_arys)
  all_chars.select do |char|
    key_char_arys.all? { |char_ary| char_ary.include?(char) }
  end
end

def selected_chars(tally_char_hash, all_common_chars)
  tally_char_hash.each do |char_hash|
    char_hash.select! do |key, val|
      all_common_chars.include? key
    end
  end
end

def common_chars(ary)
  chars_arrays    = ary.map(&:chars)
  tally_char_hash = chars_arrays.map(&:tally)
  key_char_arys   = tally_char_hash.map(&:keys)
  all_chars       = key_char_arys.flatten.uniq

  all_common_chars = all_uniq_chars(all_chars, key_char_arys)
  selected_chars   = selected_chars(tally_char_hash, all_common_chars)

  result_hsh = {}

  selected_chars.each do |hsh|
    hsh.each { |k,v| result_hsh[k] ? result_hsh[k] << v : result_hsh[k] = [v] }
  end

  result_hsh.map { |k, v| (k * v.min).split('') }.flatten
end

p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaaa', 'ccdddddd', 'eefee', 'ggrrrrr', 'yyyzzz']) == []
