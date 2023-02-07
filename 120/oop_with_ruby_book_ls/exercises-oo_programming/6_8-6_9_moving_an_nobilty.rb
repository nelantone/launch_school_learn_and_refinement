# 6_8 Moving
# You have the following classes.
module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end
# You need to modify the code so that this works:

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"
# You are only allowed to write one new method to do this.

# 6.9 Nobility
# Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility,
# and the regular way of walking simply isn't good enough. Nobility need to strut.

# We need a new class Noble that shows the title and name when walk is called:

class Noble

  attr_accessor :name, :title

  def initialize(name, title)
    @name  = name
    @title = title
  end

  def walk
    puts "#{title} #{name} #{gait} forward"
  end

  private

  def gait
    "struts"
  end
end
byron = Noble.new("Byron", "Lord")
byron.walk
# # => "Lord Byron struts forward"
# We must have access to both name and title because they are needed for other purposes that we aren't showing here.

byron.name
# => "Byron"
byron.title
# => "Lord"