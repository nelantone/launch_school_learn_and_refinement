#  - Main Algorithm:
#     + when the last char is a not string-number append 1
#     + othwerwise add +1 to the total number
#       + initialize a new aray `digits`
#         + convert the strn into chars
#         + reverse the sting and take each of the digit until appears the first char-alphabeht

#       + find the number iteslf(all continous digits)
#       - from the full number add +1
#         and append it to the array reemplacing for the chars
#         * in case of zeros?
#           - find the number of zeros and check if the char is different than 9.
#           * chceck formatting? `format`

#   - Ideas:
#       when there last char is anumber then check if there are more chars.
#       * when are zeros as first digits then we need to add +! and add the specific number of zeros.
#       - if "001".to_i.to_s !=  "001"
#        ** .chars.map(&:to_i) +1 last number if is different than 9.

def char_is_digit?(str)
  ('0'..'9').include?(str)
end

def increment_present_str_number(str)
  digits    = ''
  chars     = str.reverse.chars
  idx_count = 0

  while char_is_digit?(chars[idx_count])
    digits << chars[idx_count]
    idx_count += 1
  end
  correct_ord_digits = digits.reverse

  str.gsub(correct_ord_digits, correct_ord_digits.next)
end

def increment_string(str)
  char_is_digit?(str[-1]) ? increment_present_str_number(str) : str + '1'
end


p increment_string("foo") == "foo1"
p increment_string("foobar001") == "foobar002"
p increment_string("foobar1") == "foobar2"
p increment_string("foobar00") == "foobar01"
p increment_string("foobar99") == "foobar100"
p increment_string("") == "1"
p increment_string("foo099") == "foo100"
p increment_string("f00bar") == "f00bar1"