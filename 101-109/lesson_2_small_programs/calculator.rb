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
first_operator = 0
second_operator = 0

def prompt(text)
  puts ">> #{text}"
end

def operation(first_operator, second_operator, operation)
  case operation
  when '+'
    prompt('Addition')
    prompt(first_operator + second_operator)
  when '-'
    prompt('Substraction')
    prompt(first_operator - second_operator)
  when '*'
    prompt('Multiplication')
    prompt(first_operator * second_operator)
  when '/'
    prompt('Division')
    prompt(first_operator / second_operator.to_f)
  end
end

def operation_selector
  prompt("Add the operation you want to do:
  type '+' to addition,
  type '-' to substraction,
  type '*' to multiplication,
  type '/' to division ")
  Kernel.gets.chomp
end

def operation_validator(operation)
  loop do
    break if %w(+ - * /).include? operation
    prompt("Please write a valid operation ")
    operation = operation_selector
  end
  operation
end

loop do # main_loop
  loop do
    prompt('Please add the first operator')
    first_operator = Kernel.gets.chomp.to_i
    break if first_operator != 0
    prompt('Type a correct number(integer or number different than 0)')
  end

  loop do
    prompt('Add the second operator')
    second_operator = Kernel.gets.chomp.to_i
    break if second_operator != 0
    prompt('Type a correct number(integer or number different than 0)')
  end

  operation = operation_validator(operation_selector)

  operation(first_operator, second_operator, operation)

  prompt("Do you want to do another operation? Type 'Y'")
  question = Kernel.gets().chomp()

  break unless question.downcase == 'y'
end

prompt('Thanks for using the calculator')
