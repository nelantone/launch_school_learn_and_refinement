# Staggered Caps (Part 1)
# Write a method that takes a String as an argument, and returns a new
# String that contains the original value using a staggered capitalization
# scheme in which every other character is capitalized, and the remaining
# characters are lowercase. Characters that are not letters should not be
# changed, but count as characters when switching between upper and lowercase.
=begin
- P
  - input: string
  - ouput: string(same size)
  - rules:
    - use straggered capitalization
      - every other char is capitalized. Remaining chars lowercase
      - non letter chars should not be changed
       - but count as chars when switching between upper and lower!
- E
- D
- A
  1. do chars array
  2. iterate each char of the array using index.
  3. - when the index char is odd, make it uppercase
     - when it isn't then lowcase.

- C
=end
def staggered_case(string)
  string.chars.map.with_index { |c, idx| idx.even? ? c.upcase : c.downcase }.join
end

# Example:

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Further Exploration

def staggered_case(string, first_up)
  string.chars.map.with_index do |char, idx|
    if (first_up && idx.even?) || (first_up == false && idx.odd?)
      char.upcase
    else
      char.downcase
    end
  end.join
end

staggered_case('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'
staggered_case('I Love Launch School!', false) == 'i lOvE LaUnCh sChOoL!'

# Staggered Caps (Part 2)
# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the return
# value; they just don't count when toggling the desired case

def staggered_case(string)
  counter = 0
  string.chars.map do |char|
    if char.match?(/[a-z]/i)
      counter += 1
      (counter).odd? ? char.upcase : char.downcase
    else
      char
    end
  end.join
end

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Further Exploration
# Modify this method so the caller can determine whether non-alphabetic
# characters should be counted when determining the upper/lowercase state.
# That is, you want a method that can perform the same actions that this method
# does, or operates like the previous version.

def staggered_case(string)
  counter = 0
  string.chars.map do |char|
    if char.match?(/[a-z]/i)
      counter += 1
      (counter).odd? ? char.upcase : char.downcase
    else
      char
    end
  end.join
end

def staggered_case_alpha(string)
  string.chars.map.with_index { |c, idx| idx.even? ? c.upcase : c.downcase }.join
end

def staggered_case_non_alpha(string, non_alpha)
  non_alpha ? staggered_case(string) : staggered_case_alpha(string)
end

staggered_case_non_alpha('ALL CAPS', true) == 'AlL cApS'
staggered_case_non_alpha('ALL_CAPS', false) == 'AlL_CaPs'
