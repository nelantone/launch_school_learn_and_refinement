def square(n)
  multiply(n, n)
end

square(5) == 25

# Exploration: power to the n method

def power(num, power)
  return 0 if power == 0
  return num if power == 1
  multiply(num, power(num, power - 1))
end
