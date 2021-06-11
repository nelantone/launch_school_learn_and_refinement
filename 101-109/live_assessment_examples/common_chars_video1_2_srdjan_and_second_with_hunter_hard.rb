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

# def all_uniq_chars(all_chars, key_char_arys)
#   all_chars.select do |char|
#     key_char_arys.all? { |char_ary| char_ary.include?(char) }
#   end
# end

# def selected_chars(tally_char_hash, all_common_chars)
#   tally_char_hash.each do |char_hash|
#     char_hash.select! do |key, _val|
#       all_common_chars.include? key
#     end
#   end
# end

# def common_chars(ary)
#   chars_arrays    = ary.map(&:chars)
#   tally_char_hash = chars_arrays.map(&:tally)
#   key_char_arys   = tally_char_hash.map(&:keys)
#   all_chars       = key_char_arys.flatten.uniq

#   all_common_chars = all_uniq_chars(all_chars, key_char_arys)
#   selected_chars   = selected_chars(tally_char_hash, all_common_chars)

#   result_hsh = {}

#   selected_chars.each do |hsh|
#     hsh.each { |k, v| result_hsh[k] ? result_hsh[k] << v : result_hsh[k] = [v] }
#   end

#   result_hsh.map { |k, v| (k * v.min).split('') }.flatten
# end

### second time/solution

# Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates). 


# For example, if a character occurs 3 times in all strings but not 4 times, you need to inlude that character three times in the final answer


=begin
* Problem understanding:
  - Mental model:
    - return in an array all chars that are present in all string inside the given collection(includeed ther repated ones n times)

  - Input: ary

  - Output: ary

  - Rules:
    - Explicit:
      - all chars are lowercase
      - also repeated chars

  - Questions:

* Examples:

["bella", "label", "rolller"] -> 'l' is prenst twice in all ellements but in the last one is present 3 times.
* The mini present in all is 2. then  is twice
  ['e','l,'l']

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - find the chars that are all present counting the times from each element 

  - Ideas:
    - tally
    - basic reassigment of groups/slices

  - Apporach:
  ** 1
    - init result ary
    - iterate from given array to each elem
    - from the first element take each char base
    - from the second elem compare each of his chars
      - if char is present add +1
      - otherwise ignore it

  ** 2
    + init result ary
    + init trallys array
    + iterate from given array to each elem
    + from each element find each chars and number of times(tally)
    + find out when the char is present in all
    + I want the unique elements present in all chars
    + find onlye the chars that are presnet in all.
    + find the counts from a specific char.
    + return the min of counts from the specific char
    + return n times each char and sotre it in result


  - Higher Level Algorithm(helper methods):
    + find_tallys
    + find_uniq_chars
    + select_common_chars
    + return_n_times_chars
* Code:
=end

def find_tallys(ary)
  ary.map { |subar| subar.chars.tally }
end

def select_common_chars(tallys)
  tallys_keys = tallys.map(&:keys)
  uniq_elems  = tallys_keys.flatten.uniq
  common_el   = uniq_elems.select do |element|
    tallys_keys.all? { |ary_chars| ary_chars.include? element }
  end
  tallys.map do |n_tally|
    n_tally.select { |char, _| common_el.include? char }
  end
end

def return_n_times_chars(result_ary)
  result_hash = {}
  result_ary.each do |hash|
    hash.each do |char, times|
      if result_hash[char].nil?
        result_hash[char] = times
      else
         result_hash[char] = times if result_hash[char] >  times
      end
    end
  end
  result_hash.map { |char, times| char * times }.join.split('')
end

def common_chars(ary)
  tallys = find_tallys(ary)
  result = select_common_chars(tallys)
  return_n_times_chars(result)
end



p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaaa', 'ccdddddd', 'eefee', 'ggrrrrr', 'yyyzzz']) == []
