# Define a method that takes in a string and outputs the same string processed in a particular way.
# The method should insert only after the first occurrence of each character of the input string, all the alphabet letters that:
# -are NOT in the original string
# -come after the letter you are processing
# Each added letter should be in uppercase, the letters of the original string will always be in lowercase.
# Example:
# input: "holly"
# missing letters: "a,b,c,d,e,f,g,i,j,k,m,n,p,q,r,s,t,u,v,w,x,z"
# output: "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
# You don't need to validate input, the input string will always contain a certain amount of lowercase letters.

# LONG
=begin
* Problem understanding:
  - Mental model:
    we want to return the missing letters from the alphabet (left to right)
    that are not used on the passed string and uppercase the missing letters

  - Input: str

  - Output: str

  - Rules:
    - Explicit:
      - we don't need to validate the input
      - the input string will always contain a certain amount of lowercase letters.
      - the non present alphabet letters are uppercase.

    - Implicit:
      - when is a letter repeated we need to add the letter itself but not repeating the alphabet
      - result is ordered as it comes and is only one string

* Examples:

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - take the first character.. fill the left with the next aplhabet letters until z.

  - Ideas:
    - first do the first letter.
      - then continue with the second and find edge cases

  - Higher Level Algorithm(helper methods):
    -

* Code:
=end

def remove_upcase_version_from_downcase_str(result, str)
  chars_result = result.chars

  removed_upcase_version_from_str = chars_result.reject do |char|
    str = str.upcase

    str.include? char
  end

  removed_upcase_version_from_str.join
end

def insert_missing_letters(str)
  result = ''
  used_chars = ''

  str.chars do |char|
    missing_letters = (char.next.upcase..'Z').to_a.join

    if !used_chars.include?(char)
      used_chars << char
      char       << missing_letters
    end
    result << char
  end

  remove_upcase_version_from_downcase_str(result, str)
end

p insert_missing_letters("x") == "xYZ"
p insert_missing_letters("hello") == "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
p insert_missing_letters("holly") == "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
p insert_missing_letters("odveo") == "oPQRSTUWXYZdFGHIJKLMNPQRSTUWXYZvWXYZeFGHIJKLMNPQRSTUWXYZo"
p insert_missing_letters("eyivrbkagbioavtbfdktmhdym") == "eJLNPQSUWXZyZiJLNPQSUWXZvWXZrSUWXZbCJLNPQSUWXZkLNPQSUWXZaCJLNPQSUWXZgJLNPQSUWXZbioPQSUWXZavtUWXZbfJLNPQSUWXZdJLNPQSUWXZktmNPQSUWXZhJLNPQSUWXZdym"
p insert_missing_letters("abcdefghijklmnopqrstuvwxyz") == "abcdefghijklmnopqrstuvwxyz"
p insert_missing_letters("pfdlagnbzeepkbiiqpudfthtii") == "pRSVWXYfJMORSVWXYdJMORSVWXYlMORSVWXYaCJMORSVWXYgJMORSVWXYnORSVWXYbCJMORSVWXYzeJMORSVWXYepkMORSVWXYbiJMORSVWXYiqRSVWXYpuVWXYdftVWXYhJMORSVWXYtii"
p insert_missing_letters("z") == "z"
p insert_missing_letters("vjxxwtjzxasuouzjrxoocfvjeywmvgeoyzz") == "vjKLNPQxxwtjzxaBDHIKLNPQsuoPQuzjrxoocDHIKLNPQfHIKLNPQvjeHIKLNPQywmNPQvgHIKLNPQeoyzz"
