# What does the following code return?
# What does it output? Why?
# What concept does it demonstrate?

a = 'Hello'
b = a
a = 'Goodbye'

# 1(return). the folowing code output nothing as we don't use puts, p and we are not using any function
#
# 2(output).
# On `line5` we initialize the variable a with a 'Hello' string
# On `line6` we initialize the variable make in it equal to variable a
# On `line7` we reassign the variable a to 'Goodbye'
#
# 3(concept) with the example we can demostrate that when we reassign a variable(in this case 'a' to 'goodbye') we mutate the initial value and stops pointing to the same point of memory from b('b' keeps the intial value of a.
# and we are pointing to another part of memory.
# We can show this using 'p' below, as we see b is 'hello' and a changes while we reassign.

puts '###'
puts 'initialize a to hello'
p a = 'Hello'
puts 'assign a to initialized variable b'
p b = a
puts 'we reassign a to goodbye'
a = 'Goodbye'
puts 'calling b later reassign a'
p b
puts 'calling a later reassigment'
p a
