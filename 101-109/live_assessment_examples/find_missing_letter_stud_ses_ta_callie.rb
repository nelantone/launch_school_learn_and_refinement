# Find the missing letter:

# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

# You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.

# The array will always contain letters in only one case.

# Use the English alphabet with 26 letters.

=begin
* Problem Understanding:
  - Promblem domain: none

  - Mental model:
    find/return the one missing letter in a specific sorted alphabet array.

  - Input: array collection of aphabet strings(without missing letter)
  - Output: string(missing letter)

  - Rules:
    - Implicit:
      - Array of consecutive (increasing) letters.
      - You will always get an valid array
      - And it will be always exactly one letter be missing
      - The length of the array will always be at least 2.
      - The array will always contain letters in only one case.
      - English alphabet with 26 letters.
    - Explicit:
      - Aphabet can be upcase.

  - Questions: none so far

* Examples(below):
 - no need of extra examples so far

* Data Structure:
 - Maybe using a range with all included letters and converting it as an array.
* Algorithm:
 - with the last and first letter of the given array, create a new array with
  all alphabet letters on that range(we can start it as a range)
 - we transform the range to an array collection.
 - In the end, we just want the difference between our initial array and the
  new array with the included char letter. This is why we can just substract
  * We need to test if we can just substract directly using 2 arrays.
  - once we substract the number, the result is still an array and we need to
    extract our result.
* Code:
=end

def find_missing_letter(missing_letter_ary)
  full_ary_letters = (missing_letter_ary[0]..missing_letter_ary[-1]).to_a

  (full_ary_letters - missing_letter_ary)[0]
end

# alternative solution
def find_missing_letter(ary)
  full_ary_letters = (ary[0]..ary[-1]).to_a

  full_ary_letters.to_a.each { |char| return char unless ary.include?(char) }
end

p find_missing_letter(["a", "b", "c", "d", "f"]) == "e"
p find_missing_letter(["O", "Q", "R", "S"]) == "P"
p find_missing_letter(["b", "d"]) == "c"
p find_missing_letter(["a", "b", "d"]) == "c"
p find_missing_letter(["b", "d", "e"]) == "c"
