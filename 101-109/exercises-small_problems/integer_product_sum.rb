=begin
Write a program that asks the user to enter an integer greater than 0,
then asks if the user wants to determine the sum or product of all numbers
between 1 and the entered integer.
=end
puts "Please enter an integer greater than 0:"
integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
choice = gets.chomp

case choice
when 's'
  sum_int = (1..integer).sum
  puts "The product of the integers between 1 and #{integer} is #{sum_int}"
when 'p'
  prod_int = (1..integer).inject(:*)
  puts "The product of the integers between 1 and #{integer} is #{prod_int}"
else
  puts "this is not a valid choice, try again"
end
