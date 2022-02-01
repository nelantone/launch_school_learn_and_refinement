# Question 4
# The designers of the vehicle management system now want to make an
# adjustment for how the range of vehicles is calculated.
# For the seaborne vehicles, due to prevailing ocean currents, they want to
# add an additional 10km of range even if the vehicle is out of fuel.

# Alter the code related to vehicles so that the range for autos and
# motorcycles is still calculated as before, but for catamarans and
# motorboats, the range method will return an additional 10km.

# Answer:
# We don't need the WheeledVehicle related code.
module Moveabble
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency
  # we need to be able to read fuel_capacity and fuel_efficiency for using
  # these methods on range.

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

# We can over-ride the range method in the Seacraft class. This means that
# the range method of the Moveable module will continue to be effective for
# the autos and motorcycles, but that calling range on catamarans and
# motorboats will be handled by the range method defined on the Seacraft
# class and take precedence.

# We can use the super keyword to get the value from the Moveable module
# that's included by Seacraft, and then add the additional 10km of range
# before returning it.

class Seacraft
  include Moveabble

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = fuel_efficiency
    self.fuel_capacity = fuel_capacity
  end

  ## here over-ride #range is the change
  def range
    super + 10
  end
end

class Catamaran < Seacraft
end

class Motorboat < Seacraft
  def initialize
    super(1,1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

# Maybe Re-do