# find the k size combination string elemtents that creates the biggest substring as result.
# * Level easy-medium of small problems

# You are given an array of strings and an integer k. Your task is to return
# the first longest string consisting of k consecutive strings taken in the array.
# #Example:
# longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"
# n being the length of the string array, if n = 0 or k > n or k <= 0 return "".

=begin
* Problem understanding:
  - Mental model:
    find the k size combination string elemtents that creates the biggest substring as result.

  - Input: array of strings

  - Output: string

  - Rules:
    - Explicit:
      - second argument is the `k` size of consecutive possible combinations.
      - return "" when `n` length of the string array is:
        -  n = 0
        - `k` is greater than n(size)
        - `k` is smaller equal `0`
    - Implicit:
      - Consecutive combinations needs to be only from left to right.
      - we need to return the FIRST maximum length of char strings inside the array.

  - Questions:

* Examples:
  # longest_consec(["zone", "abigail", "theta", "abigail"], 2) --> "abigailtheta"
  # n being the length of the string array, if n = 0 or k > n or k <= 0 return "".

* Data Structure:
    - array of subarray combinations

* Algorithm:
  - Main Algorithm:
    - initial a local variable to keep track of the longest consecutive string
    - guard clause: return longest consecutive string (empty string) if n = 0 or k < =0 or k>= n
    - initial a local variable to keep track of a maximum value (sum of the strings)
    - iterate from a starting index (0) and an ending index that is dependent on the size of the total array and k
      - ending index is a fuction of the size of the main array and k (main array size - k)
    - generate a subarray from the main array that is at the current index and a length of k
    - join the elements in the subarray and find the length of those elements
    - if the length is > max, store the length in the max and replace the longest consecutive string
    - return the longest consecutive string

  - Ideas:
    - create all possible consecutive combinations of size `k` word-strings and use sum the size of each string inside the subarray.
      find the maximum result.
    - then just join the array into one string.

  - Higher Level Algorithm(helper methods):

* Code:
=end


def longest_consec(arr, k)
  longest_str = ""
  n = arr.size
  return longest_str if n == 0 || k <= 0 || k >= n

  max = 0

  (0..(n - k)).each do |i|
    current_size = arr[i, k].map(&:size).sum
    if current_size > max
      max = current_size
      longest_str = arr[i, k].join('')
    end
  end

  longest_str
end

p longest_consec(["a", "ab", "abc", "d", "ee", "abcde", "bbb"], 6) == "ababcdeeabcdebbb"
p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"
p longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1) == "oocccffuucccjjjkkkjyyyeehh"
p longest_consec([], 3) == ""
p longest_consec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2) == "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
p longest_consec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2) == "wlwsasphmxxowiaxujylentrklctozmymu"
p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], -2) == ""
p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3) == "ixoyx3452zzzzzzzzzzzz"
p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15) == ""
p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0) == ""

# Repeat this problem at least once.
# R: 1. t: 30`(Tonio: Algorithm . Mia: Code)