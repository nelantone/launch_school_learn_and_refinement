# 7.5 Stack Machine Interpretation
#  Stack Machine Interpretation
# This is one of the hardest exercises in this exercise set. It uses both exceptions and Object#send, neither of which we've discussed in detail before now. Think of this exercise as one that pushes you to learn new things on your own, and don't worry if you can't solve it.
#
# You may remember our Minilang language from back in the RB101-RB109 Medium exercises. We return to that language now, but this time we'll be using OOP. If you need a refresher, refer back to that exercise.
#
# Write a class that implements a miniature stack-and-register-based programming language that has the following commands:
#
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).
#
# Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.
#
# You should initialize the register to 0.
#
# Examples:
#
# Copy Code
# Minilang.new('PRINT').eval
# # 0
#
# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15
#
# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8
#
# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5
#
# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!
#
# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6
#
# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12
#
# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB
#
# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8
#
# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)

class Minilang
  attr_accessor :input, :register, :stack

  def initialize(input)
    @input = input
    @register = 0
    @stack = []
  end

  def action(item)
    if item =~ /\A[-+]?\d+\z/
      # n Place a value n in the "register". Do not modify the stack.
      @register = item.to_i
    elsif item == 'PUSH'
      # Push the register value on to the stack. Leave the value in the register.
      stack.push(register)
    elsif item == 'MULT'
      # Pops a value from the stack and multiplies it by the register value, storing the result in the register.
      @register *= stack.pop
    elsif item == 'DIV'
      @register /= stack.pop
    elsif item == 'ADD'
      @register += stack.pop
    elsif item == 'POP'
      # POP Remove the topmost item from the stack and place in register
      @register = stack.pop
    elsif item == 'MOD'
      @register %= stack.pop
    end
    register
  end

  def eval
    inputs = input.split
    output = []
    return @register if (inputs.size == 1 && input == 'PRINT')
    if inputs.size > 1
      inputs.each do |each_in|
        (output << register && next) if each_in == 'PRINT'
        action(each_in)
      end
    end
    return 'Empty stack!' if output.last.nil?
    puts output
  end
end

Minilang.new('PRINT').eval == 0
Minilang.new('5 PUSH 3 MULT PRINT').eval
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # # # 5  3 8
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # # # 10  5
Minilang.new('5 PUSH POP POP PRINT').eval == 'Empty stack!'
# # # Empty stack!
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # # 6
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # # 12