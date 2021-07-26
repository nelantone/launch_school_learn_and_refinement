# 1
# Using the following code, create two classes - Truck and Car - that both inherit from Vehicle.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end


class Truck < Vehicle

end

class Car < Vehicle
end
truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year

# Expected output:

# 1994
# 2006

# 2
# Start the Engine (Part 1)
# Change the following code so that creating a new Truck automatically invokes #start_engine.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle

  def initialize(year)
    super(year)
    self.start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year
# Expected output:

# Ready to go!
# 1994


# 3 Only Pass the Year
# Using the following code, allow Truck to accept a second argument upon instantiation. Name the parameter bed_type and implement the modification so that Car continues to only accept one argument.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :year, :bed_type
  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type
# Expected output:

# 1994
# Short


# 4 Start the Engine (Part 2)
#Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!' to the return value of #start_engine in Vehicle. The 'fast' in 'Drive fast, please!' should be the value of speed.

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    "Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')
# Expected output:

# Ready to go! Drive fast, please!