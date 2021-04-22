# Problem:
# Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.

=begin
# * Problem understanding:
#   - Mental model:
      from EACH word move the first letter to the end and add `ay` to the end of the world.

#   - Input: string

#   - Output: string

#   - Rules:
#     - Explicit:
        -  Leave punctuation marks untouched.

#     - Implicit:
        - when is one char  just add `ay` in the end.

#   - Questions:

# * Examples:
'Pig latin is cool' => igPay atinlay siay...

# * Data Structure:
#     - array

# * Algorithm:
#   - Main Algorithm:
      - initialize an result array
      - create a new array with the string.
      - spliting the str ine each given space as a new element
      -  if the element is a special char  just appned it on the result array
          - find if is a special char:
      -  otherwise take the chec at index at and add it in the end of the same element
        -  append `ay` stirng
        -  append the modified string to result array
        - from the result array we want join each element an conver it to a new string

#   - Higher Level Algorithm(helper methods):

# * Code:
=end

def pig_latin(word)
   append_char = word[0]

   word.gsub!(word[0], '')
   word << append_char + 'ay'
end

p pig_latin('tempora') == 'emporatay'


def pig_it(str)
  result = []
  ary_of_words = str.split(' ')

  ary_of_words. each do |word|
     if (/[a-z]/i).match?(word)
       pig_latin(word)
     end
    result << word
  end
  result.join(' ')
end


p pig_it("O tempora o mores !") == "Oay emporatay oay oresmay !"
p pig_it('Hello world !') == 'elloHay orldway !'
p pig_it('Pig latin is cool') == 'igPay atinlay siay oolcay'
p pig_it('This is my string') == 'hisTay siay ymay tringsay'

# 25`