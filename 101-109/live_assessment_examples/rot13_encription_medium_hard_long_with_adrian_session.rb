=begin
5kyu

How can you tell an extrovert from an introvert at NSA? Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.

I found this joke on USENET, but the punchline is scrambled. Maybe you can decipher it? According to Wikipedia, ROT13 (http://en.wikipedia.org/wiki/ROT13) is frequently used to obfuscate jokes on USENET.

Hint: For this task you're only supposed to substitue characters. Not spaces, punctuation, numbers etc. Test examples:

rot13("EBG13 rknzcyr.") == "ROT13 example.";
rot13("This is my first ROT13 excercise!" == "Guvf vf zl svefg EBG13 rkprepvfr!"

Rot 13 means each letter is replaced by the letter appearing 13 places in the alphabt. after the original letter. Last 13 letters alphabet you start over.
=end



=begin
* Problem understanding:
  - Mental model:
    - replace each char as alphabet lether from the 13 char inside the alphabet

  - Input: str

  - Output: str

  - Rules:
    - Explicit:
      - ignore spaces, puntuaction & nums

    - Implicit:

  - Questions:

* Examples:

* Data Structure:
    - array/hash?

* Algorithm:
  - Main Algorithm:
    - split the full string into element/chars and iterate trough each element
      - go 13 chars from each albhabet letter
      - find a way to find when are uppercase letters

  - Ideas:

  - Apporach:
    + initialize constans from alphabet
      + downcase
      + upcase
    + define ro13
    + init result arry
    + split the full string into elemen/chars
    + iterate to each el
    + ignore the non alphanumeric chars and just append into result
      + if letter is downcase
        + find downcase alpha  in +13
      *** what will happen if the letter is +13 and we are ithe end of the alphabet.
        example: 'z'...

      + if letter is upcase find upcase alpha in +13
      + append each off the elements

  - Higher Level Algorithm(helper methods):
    - upcased??

* Code:
=end
alpha_down      = ('a'..'z').to_a
alpha_up        = ('A'..'Z').to_a
half_alpha_down = ('a'..'z').to_a[0,13]
half_alpha_up   = ('A'..'Z').to_a[0,13]
ALPHA_AND_HALF_DOWN = alpha_down.concat(half_alpha_down).freeze
ALPHA_AND_HALF_UP   = alpha_up.concat(half_alpha_up).freeze


def upcased?(char)
  char.upcase == char
end

def rot13(str)
  result = []

  str.each_char do |char|
    if ALPHA_AND_HALF_DOWN.include?(char) || ALPHA_AND_HALF_UP.include?(char)
      if upcased?(char)
         char_index = ALPHA_AND_HALF_UP.index(char)
         result <<  ALPHA_AND_HALF_UP[char_index+13]
      else
         char_index = ALPHA_AND_HALF_DOWN.index(char)
         result <<  ALPHA_AND_HALF_DOWN[char_index+13]
      end
    else
      result << char
    end
  end
  result.join
end

p rot13("b") == "o"
p rot13("Abc") == "Nop"
p rot13("xYz") == "kLm"
p rot13("EBG13 rknzcyr.") == "ROT13 example."
p rot13("This is my first ROT13 excercise!") == "Guvf vf zl svefg EBG13 rkprepvfr!"

# ALPHA_CHARS = ("a".."z").to_a

# def rot13(str)
#   str.chars.map do |str_char|
#     index = ALPHA_CHARS.index(str_char.downcase)

#     if !ALPHA_CHARS.include?(str_char.downcase)
#       str_char
#     else
#       if ALPHA_CHARS.index(str_char.downcase) + 13 > ALPHA_CHARS.size - 1
#         str_char == str_char.upcase ? ALPHA_CHARS[index - 13].upcase :  ALPHA_CHARS[index - 13]
#       else
#         str_char == str_char.upcase ? ALPHA_CHARS[index + 13].upcase :  ALPHA_CHARS[index + 13]
#       end
#     end
#   end.join
# end



# def change_char_lowercase(char)
#   char.ord > 109 ? (char.ord - 13).chr : (char.ord + 13).chr
# end

# def change_char_uppercase(char)
#   char.ord > 77 ? (char.ord - 13).chr : (char.ord + 13).chr
# end

# def rot13(string)
#   string.chars.map do |char|
#     if ("a".."z").to_a.include?(char)
#       change_char_lowercase(char)
#     elsif
#       ("A".."Z").to_a.include?(char)
#       change_char_uppercase(char)
#     else
#       char
#     end
#   end.join
# end

# =begin
# Decipher this!
# 6 kyu
# You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

# For each word:

# the second and the last letter is switched (e.g. Hello becomes Holle)
# the first letter is replaced by its character code (e.g. H becomes 72)
# Note: there are no special characters used, only letters and spaces

# Examples

# decipherThis('72olle 103doo 100ya'); // 'Hello good day'
# decipherThis('82yade 115te 103o'); // 'Ready set go'


p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help
=end