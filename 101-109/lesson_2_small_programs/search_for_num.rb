=begin
Mn-PEDAC:
1 Problem understanding
We want to get user input for 6 numbers
and we want to know if the last number is present.

- Problem domain: no.
- explicit:
 - input: integer
 - output: x does appear/not appear in [x..z]
- implicit:
 - input: seems to be an integer but doesn't need validation
- rules: needs to be all numbers.
- clarifying questions: it's a simple program. But should we add some validators?

2 Examples and test

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

3 Data structure
- constant array for ordinal nums
- loop to make dry the print before the input number
- array to save 1 to 5 numbers

4 Algorithm
 check if the last number is present in the array colection:
 If the last number is included in the colection print
 The number x appears in [a...x..z].
 else then: The number x does not appear in [a..z].
5 Code
=end

ORDINAL = %w(1st 2nd 3rd 4th 5th last)

number_collection = []
num, presence = ''
ORDINAL.each do |ordin|
  puts "==> Enter the #{ordin} number:"
  num = gets.chop.to_i
  number_collection << num unless ordin == 'last'
  if ordin == 'last'
    if number_collection.include?(num)
      presence = "appears"
    else
      presence = "does not appear"
    end
  end
  puts "The number #{num} #{presence} in #{number_collection}."
end
