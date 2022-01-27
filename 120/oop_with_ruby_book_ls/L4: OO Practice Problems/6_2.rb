# Question 2
# Ben and Alyssa are working on a vehicle management system. So far, they
# have created classes called Auto and Motorcycle to represent automobiles
# and motorcycles. After having noticed common information and calculations
# they were performing for each type of vehicle, they decided to break out
# the commonality into a separate class called WheeledVehicle.
# This is what their code looks like so far:


class WheeledVehicle
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

# Now Alan has asked them to incorporate a new type of vehicle into their
# system - a Catamaran defined as follows:


class Catamaran
  attr_reader :propeller_count, :hull_count
  attr_accessor :speed, :heading

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end

# This new class does not fit well with the object hierarchy defined so far.
# Catamarans don't have tires. But we still want common code to track fuel
# efficiency and range. Modify the class definitions and move code into a
# Module, as necessary, to share code among the Catamaran and the wheeled
# vehicles.

=begin
Official Answer.
Move the common behavior into a module
=end
module Moveabble
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency
  # we need to be able to read fuel_capacity and fuel_efficiency for using
  # these methods on range.

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Moveabble

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end


class Catamaran
  include Moveabble
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end



=begin
Non-Official Answer=
The easiest solution is to use a module where we can use for auto and motorcicle
and change the parent class name.
To have a better picture this can be the new inheritance ansd relation:
           Vehicle
         /    |    \
        /     |     \
       /      |      \
    Auto    Motorcycle  Catamaran
    ---     ---------  --------
  @tires     @tires     /
  @fuel_eff  @fuel_eff  @fuel_eff
  @fuel_cap  @fuel_cap  @fuel_cap

=end

class Vehicle
  attr_accessor :speed, :heading

  def initialize( km_traveled_per_liter, liters_of_fuel_capacity)
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < Vehicle
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity, tires)
    super(50, 25.0)
    @tires = [30,30,32,32]
    # 4 tires are various tire pressures
  end
end

class Motorcycle < Vehicle
  def initialize(tires, km_traveled_per_liter, liters_of_fuel_capacity)
    super(80, 8.0)
    @tires = [20,20]
    # 2 tires are various tire pressures
  end
end

class Catamaran < Vehicle
  attr_reader :propeller_count, :hull_count
  attr_accessor :speed, :heading

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
  end
end

# Re-do! Ask!