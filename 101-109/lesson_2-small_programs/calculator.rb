require 'yaml'
MSG = YAML.load_file('calculator_messages.yml')

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
@lang = ''

def prompt(text)
  Kernel.puts(">> #{text}")
end

prompt("Welcome to the calculator/ Bienvenido a la calculadora")
loop do
  prompt("Choose your language 'en','es'/Elige tu idioma 'en','es'")
  @lang = gets.chomp
  break if ['en', 'es'].include? @lang
end
prompt(MSG[@lang]['write_name'])
name = Kernel.gets().chomp()
prompt("#{MSG[@lang]['greeting']} #{name}")

def operation(first_operator, second_operator, operation)
  case operation
  when '+'
    prompt(first_operator + second_operator)
  when '-'
    prompt(first_operator - second_operator)
  when '*'
    prompt(first_operator * second_operator)
  when '/'
    prompt(first_operator / second_operator.to_f)
  end
end

def oper_message(operation)
  case operation
  when '+'
    prompt(MSG[@lang]['add'])
  when '-'
    prompt(MSG[@lang]['sub'])
  when '*'
    prompt(MSG[@lang]['mult'])
  when '/'
    prompt(MSG[@lang]['div'])
  end
end

def operation_selector
  prompt(MSG[@lang]['add_operation'])
  Kernel.gets.chomp
end

def operation_validator(operation)
  loop do
    break if %w(+ - * /).include? operation
    prompt(MSG[@lang]['valid_op'])
    operation = operation_selector
  end
  operation
end

def float?(string)
  true if Float(string)
rescue StandardError
  false
end

def integer?(string)
  true if Integer(string)
rescue StandardError
  false
end

def number?(string)
  if float?(string) || integer?(string)
    if integer?(string)
      string.to_i
    else
      string.to_f
    end
  end
end

loop do # main_loop
  loop do
    prompt(MSG[@lang]['add_first_op'])
    first_operator = Kernel.gets.chomp
    if number?(first_operator)
      first_operator = number?(first_operator)
      break
    end
    prompt(MSG[@lang]['correct_num'])
  end

  loop do
    prompt(MSG[@lang]['add_second_op'])
    second_operator = Kernel.gets.chomp
    if number?(second_operator)
      second_operator = number?(second_operator)
      break
    end
    prompt(MSG[@lang]['correct_num'])
  end

  operation = operation_validator(operation_selector)

  oper_message(operation)
  operation(first_operator, second_operator, operation)

  prompt(MSG[@lang]['other_operation'])
  question = Kernel.gets().chomp()

  break unless question.downcase == 'y'
end

prompt(MSG[@lang]['thanks'])
