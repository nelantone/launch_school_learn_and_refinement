# 1.Count letters in string
# (https://www.codewars.com/kata/5808ff71c7cfa1c6aa00006d/train/ruby)
# 6 kyu

=begin
Count letters in string
In this kata, you've to count lowercase letters in a given string and return the
letter count in a hash with 'letter' as key and count as 'value'. The key must
be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

Example:

letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
=end

# in ruby version equal or greater 2.7
def letter_count(string)
  string.chars.tally.transform_keys(&:to_sym)
end

# older ruby versions
def letter_count(str)
  str.chars.each_with_object({}) do |char, hsh|
    sym_char = char.to_sym
    hsh.key?(sym_char) ? hsh[sym_char] += 1 :  hsh[sym_char] = 1
  end
end


p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
