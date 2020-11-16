# https://launchschool.com/blog/live-session-beginning-ruby-part-4
# write a method that takes a string as an argument, return string in rever order without using the revers method

str = 'reverse'

def reverser(string)
  reverse_ary = []
  ary = string.split('')
  ary.each_with_index { |_item, index| reverse_ary << string[ary.size.to_i - (index + 1)] }
  puts reverse_ary.join('')
end

reverser(str)

# or

def reverser_2(string)
  reverse_ary = []
  ary = string.split('')
  ary.length.times { |_t| reverse_ary << ary.pop }
  puts reverse_ary.join('')
end

reverser_2('reverse')
