# Find the length of the longest substring in the given string that is the
# same in reverse.

# As an example, if the input was "I like racecars that go fast", the substring
# (racecar) length would be 7.

# If the length of the input string is 0, return value must be 0.

# Example:
# "(a)" -> 1
# "(a|a)b" -> 2
# "(a)bcde" -> 1
# "zz(ba|ab)cd" -> 4
#"(ba|ab) lkj (1234|5|4321)33d" => When is odd size we need to include the item in the middle as
# "123454321".size => 9
# '(rac|e|car)' => "racecar".size => 7
# "" -> 0



=begin
* Problem understanding:
  - Problem domain:
    - Palindorme: characters that are the same writen as in reverse. "racecar".reverse== racecar

  - Mental model:
    - find the longest substring that reverse is the ame substring and return the size/length  

  - Input: string

  - Output: number

  - Rules:
    - Explicit:
      - reverse usbstrings needs to be equal to the original

    - Implicit:
      - all inputs are downcase and letters/numbers, seem to be also spaces possible.

  - Questions:

* Examples:
#"(ba|ab) lkj (1234|5|4321)33d" => When is odd size we need to include the item in the middle as
# "123454321".size => 9
# '(rac|e|car)' => "racecar".size => 7
# "" -> 0
* Data Structure:
    - array of substring candidates

* Algorithm:
  - Main Algorithm:
    - create substring of characters form the bigges to the smallest.
      - if there is no palindorme biger than 2-3 return 1(unless is an empty string (then 0)
    - from the substring check the reverse version to see if is palindrome 
      - If it is palindorm add it into a palindromes array add it as substring otherwise continue
    - find the longes palindorme substring and return the value.

  - Ideas:
    - create substring of characters form the bigges to the smallest.

  - Higher Level Algorithm(helper methods):
    - find palindromes

* Code:
=end

# def find_palindromes(str)
#   palindromes = []

#   (str.size).times do |size|
#     str.chars.each_cons(size+1) do |candidate_ary|
#       candidate = candidate_ary.join
#       palindromes << candidate if candidate == candidate.reverse
#     end
#   end
#   palindromes
# end

# def longest_palindrome(str)
#   return 0 if str.empty?
#   find_palindromes(str).map(&:size).max
# end

# p find_palindromes("a") == ["a"]
# p find_palindromes("baabcd") == ["b", "baab"]
# p find_palindromes("baab1232") == ["b", "baab", "2", "232"]

#  second time solution
# def longest_palindrome(str)
#   (str.size-1).downto(0) do |substr_idx|
#     substr_size = substr_idx + 1

#     str.chars.each_cons(substr_size) do |con|
#         return substr_size if (con == con.reverse)
#      end
#   end
#   0
# end

# second time solution whithout each cons
def each_cons(size, str)
  result = []
  count  = (str.size - size+1)
  idx_at = 0

  count.times do |idx|
    result << str[idx_at, size]
    idx_at += 1
  end
  result
end

# p each_cons(7,"I like racecars that go fast") #== ["baa", "bcd"]
# p each_cons(2,"baa")

def longest_palindrome(str)
  (str.size-1).downto(0) do |substr_idx|
    substr_size = substr_idx + 1
    ary_cons    = each_cons(substr_size, str)

    ary_cons.each { |con| return substr_size if (con == con.reverse) }
  end
  0
end


p longest_palindrome("") == 0
p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
p longest_palindrome("I like racecars that go fast") == 7


