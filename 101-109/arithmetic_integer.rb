=begin
PEDAC

Problem undersatanding:
Write a program that prompts the user for two positive integers,
and then prints the results of the following operations on those two numbers:
addition, subtraction, product, quotient, remainder, and power.
Do not worry about validating the input.

- problem domain: /
- implicit/
 - input: /
 - output: result is as integer.
- explicit
  - input: 2 numbers 1 operand
  - output: number and result(implicitely integer)
- rules:
- mental model: /
Examples and test
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
Data structure
- method encapsulation
Algortihm
need to do apply the operations
Code
=end

puts "==> Enter the first number:"
number1 = gets.chomp.to_i
puts "==> Enter the second number:"
number2 = gets.chomp.to_i

def arithmetic_return(number1, number2, operation)
  number1.send(operation, number2)
end

def display_info(number1, number2, operation)
  total = arithmetic_return(number1, number2, operation)
  puts "==> #{number1} #{operation} #{number2} = #{total}"
end

operations = [:+, :-, :*, :/, :%, :**]

operations.each do |op|
  display_info(number1, number2, op)
end
