# frozen_string_literal: true

# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result
# Use the Kernel.gets() method to retrieve user input,
# and use Kernel.puts() method to display output. Remember that
# Kernel.gets() includes the newline, so you have to call chomp() to remove it:
# Kernel.gets().chomp().

# Pseudocode
# ask the user to type two numbers. input 1
# ask the user to shoose between add, substract, miltilply or divide. input 2
# perform the operation
# display the result to the user. final output

# Kernel.puts('Please add the first operator')
# first_operator = Kernel.gets.chomp.to_i
# Kernel.puts('Add the second operator')
# second_operator = Kernel.gets.chomp.to_i
# Kernel.puts("Add the operation you want to do '+','-','*','/'")
# operation = Kernel.gets.chomp

def operation(first_operator, second_operator, operation)
  case operation
  when '+'
    Kernel.puts(first_operator + second_operator)
  when '-'
    Kernel.puts(first_operator - second_operator)
  when '*'
    Kernel.puts(first_operator * second_operator)
  when '/'
    Kernel.puts(first_operator / second_operator.to_f)
  else
    Kernel.puts('This operation does not extist in this calculator')
  end
end

operation(first_operator, second_operator, operation)
