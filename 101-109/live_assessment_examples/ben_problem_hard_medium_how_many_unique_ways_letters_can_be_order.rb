
# Given a string find how many unique ways the letters can be ordered in sets of 3 that include at least two vowels. Only A-Z(case insensitive) are considered letters.
# - sets of 3
# - sets must contain at least 2 vowels
# - A-Z are letters, case insensitive
# - each set must be unique



# LONG
=begin
* Problem understanding:
  - Mental model:
    - find how many unique ways the letter can be orderd in sets of 3 that inlcude at least 2 vowels.

  - Input: string

  - Output: number

  - Rules:
    - Explicit:
      - case insensitive
      - ste must contain at least 2 vowels

    - Implicit:
      - empty strings return 0 as no found combinations.
      - if there are less sets than 3 also return zero.
      - we does not count the initial string

  - Questions:

* Examples:
"hello")
# "hello"->
#1 "heo"
# "oeh"
# "eoh"
# "ohe"
# "elo"
# "leo"
# "oel"
# "eol"
# "elo"
# "leo"
# "oel"
# 12 "eol"

# "anna" ->
# 1 "ana"
# 2 "aan"
# 3 "naa"

# "aei"->
# 1 'eia'
# 2 'iea'
# 3 'aie'
# 4 'iae'
# 5 'eai'
# 6 '?'


* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - downcase all letters
    - return 0 if strign is empty or str.size is smaller than 3
    - find all possible combinations from string.size to size 3
    - filter/select only combinations that at least have 2 or more vowels.

  - Ideas:

  - Apporach:
      - creat helper method `two_ro_more_vowels?`
      - init 2vowels_3items_combo array
      - downcase init string
      - do I need a guard clause?
      - find all posssible combos for str.size to 3.
      - select combinations that have 2 or more vowels
      - return the size

  - Higher Level Algorithm(helper methods):
    - two_ro_more_vowels?

* Code:
=end

def two_ro_more_vowels?(str)
  count_vowels = str.count('aeiou')

  count_vowels >= 2
end

# p two_ro_more_vowels?("anna") == true

def combinations(str)
  two_vowels_three_items = []

  str = str.downcase.scan(/[a-z]/i).join

  str.chars.permutation(3) do |cons|
    joined_cons = cons.join

    unless two_vowels_three_items.include?(joined_cons)
      if two_ro_more_vowels?(joined_cons)
        two_vowels_three_items << joined_cons
      end
    end
  end~

  two_vowels_three_items.size
end

p combinations("hello") == 12

p combinations("Anna") == 3
p combinations("aei") == 6

p combinations("aEI7") == 6
p combinations("bob") == 0
p combinations("") == 0
p combinations("ae") == 0

p combinations("cake pie") == 75
