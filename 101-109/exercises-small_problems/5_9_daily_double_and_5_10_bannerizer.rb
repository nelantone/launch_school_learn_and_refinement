=begin
Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use
String#squeeze or String#squeeze!.
=end

def crunch(string)
  non_dup = []
  string.chars.each_with_index do |word, index|
    non_dup << word unless [string[index + 1], string[index]].uniq.size == 1
  end
  non_dup.join
end

def crunch(string)
  non_dup = []
  string.each_char.with_index do |word, index|
    non_dup word unless [string[index + 1], string[index]].uniq.size == 1
  end
  non_dup.join
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

=begin
Bannerizer
Write a method that will take a short line of text, and print it within a box.

Example:

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

You may assume that the input will always fit in your terminal window.

PEDAC
P
- input: string
- output: array of arrays or just `puts`

- first try empty one.

=end

def print_in_box(string)
  total_h_bars = ("-" * string.size)
  centr_string = (string)
  empty_spaces = (" " * string.size)

  puts "+-#{total_h_bars}-+"
  puts "| #{empty_spaces} |"
  puts "| #{centr_string} |"
  puts "| #{empty_spaces} |"
  puts "+-#{total_h_bars}-+"
end

def spin_me(arr)
  arr.each(&:reverse!).join('')
end
