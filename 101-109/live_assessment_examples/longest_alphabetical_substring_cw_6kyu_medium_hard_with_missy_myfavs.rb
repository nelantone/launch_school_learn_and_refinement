=begin
Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

The input will only consist of lowercase characters and will be at least one letter long.

If there are multiple solutions, return the one that appears first.

=end

# LONG
=begin
* Problem understanding:
  - Mental model:
    - find the longest substring in alpha order and return the first if are the same size

  - Input: string

  - Output: string

  - Rules:
    - Explicit:
      - are only lowercase chars
      - needs to be at least one letter long

    - Implicit:

  - Questions:


* Examples:
 'abcdeapbcdef' -> 'abcde ap bcdef'
                sizes: 5  2.   5
  as we have same size we will take the first -> 'abcde'

* Data Structure:
    - array, hash?

* Algorithm:
  - Main Algorithm:
    - find gorup chars  that are going to the right direction of the alhpabet and creatae subarrays from eahc group
    - reutnr the greatest or the first inca s of the same size

  - Ideas:

  - Apporach:
    + intitialize candidates array
    + initialize current substring adding the first char as initial value
    + initialize max index( from the string.size -1)
    + from 0 the max_index iterate the index numbers
       + we want to find out when we need to stop adding chars and append the new subarray
        + initialize next_index
         + if the current index
           + is equal to the max_index or the current index(is the last char)
           + is greater than the next index
              + we add the current_substring into candidates
              + we reassign the current_substring to the next char
         + (else) otherwise we still in alphabetical order append the next char into current_substring
       + From the candidates array take the greates size array
       + then find the first greatest subarray by size. ` max_by(&:size)`

  - Higher Level Algorithm(helper methods):

* Code:
=end

def ordered_char_substrings(string)
  candidates        = []
  current_substring = string[0] # we add the first char as initial value
  max_index         = string.size - 1

 (0..max_index).each do |current_idx|
    current_char = string[current_idx]
    next_char    = string[current_idx.next]

    if current_idx == max_index || current_char > next_char
      candidates << current_substring

      current_substring = next_char
    else
      current_substring << next_char
    end
  end
  candidates
end

def longest(string)
  return string if string.size == 1

  ordered_char_substrings(string).max_by(&:size)
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'