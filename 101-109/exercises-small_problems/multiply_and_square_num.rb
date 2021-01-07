def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3) == 15
p multiply(1, 2)

def square(num1)
  multiply(num1, num1)
end

# in case we reallly wan to use  #multiply but are better options
def power_to(num, num_exp)
  return num if num_exp == 1
  return square(num) if num_exp == 2

  # total = 0
  # (num_exp - 2).times do # -1 we use multiply, -1 for 1st iteration.
  #   total = multiply(num, num) if total == 0
  #   total = num * total
  # end
  # total

  # better solution instead :17 to :22
  multiply(num, power_to(num, num_exp - 1))
end

p square(5) == 25
p square(-8) == 64

p power_to(3, 3)
p power_to(3, 3) == 27
p power_to(2, 3) == 8
p power_to(2, 5) == 32
p power_to(5, 1) == 5
