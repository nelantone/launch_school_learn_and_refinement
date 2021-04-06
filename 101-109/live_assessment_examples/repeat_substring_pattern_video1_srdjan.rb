# Given a non-empty string, check if it can be constructed by  taking a
# substring of it and appending multiple copies of the substring together.
# You may assume the given string consists of lowercase English letters only.

# Example 1:

# Input: 'abab'
# Output: True
# Explanation: It' the substring "ab" twice.

# Example 2:

# Input: 'aba'
# Output: False

=begin
* Problem understanding:
  - Mental model:
    - see if the strings is a product of multiple copies of a substring
      (all in lowercase). Return tru if this is the case, false otherwise.

  - Input: one string

  - Output: boolean

  - Rules:
    - Explicit:
      - lowercase english letters only
      - the string can't be empty

    - Implicit:
      - for been a repetition seems to be at least 4 characters.
      - the string size needs to be an even number.

  - Questions:
      -"aa" == true?
      - should I add a validator for "" cases?
        - '' == false
        - "Abab" == false

* Examples:

* Data Structure:
    - Array of subarrays / hash?
* Algorithm:
  - Main Algorithm:
    - initialize a hash
    - divide string in two. use the result to divide the string x equal sizes.
      *(use index at and length to do it)
      - then we want to calculate a multiplier(how many times the substrings
        should be included inside? x-times from str.size divided the substring size)
      - add a product of the substrings per the multiplier(substring_x_size * multiplier)
      - this should be equal to the string as the string it shoud be a repatition of substrings.
        - if the the product_subtring_per_multiplier is equal to the string return true
        - else, continue
    - divide the string in x... re-check and repeat until the result divigin the
      size is 2.
    - if we couldn't find any substring repertion inside the string, return false.


  - Ideas:
    - stplit and create a substrings of size 2.. 3...x
     from the substrings, start with the bigges number and see if are identical
     - if are ientical return the last substring
     - if are not identical continue with the next substring collection until
       size 2.
     - if any of them are identical, return false.

  - Higher Level Algorithm(helper methods):
    - no need in this case.

* Code:
=end

def repeated_substring_pattern(str)
  return false if str.size.odd?

  sub_size = str.size

  until sub_size <= 2
    sub_size = sub_size / 2
    multiplier = str.size / sub_size

    return true if  str[0, sub_size] * multiplier == str
  end
  false
end


# def substrings(str)
#   substrings = []
#   1.upto(str.size/ 2) do |length|
#     substrings << str[0, length] if (str.size % length == 0)
#   end
#   substrings
# end

# def repeated_substring_pattern(str)
#   substrings = substrings(str)

#   substrings.each do |substring|
#     multiplier = str.size / substring.size
#     return true if substring * multiplier == str
#   end
#   false
# end

p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true