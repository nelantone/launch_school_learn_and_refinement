# 6.6 Comparing Wallets
# Consider the following broken code:

class Wallet
  include Comparable
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  private
  def <=>(other_wallet)
    if amount > other_wallet.amount
      puts 'Bill has more money than Penny'
    elsif amount < other_wallet.amount
      puts 'Penny has more money than Bill'
    else
      puts 'Bill and Penny have the same amount of money.'
    end
  end
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)

bills_wallet <=> pennys_wallet
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end
# Modify this code so it works. Do not make the amount in the wallet accessible to any method that isn't part of the Wallet class.
#
# 6.7  Pet Shelter
# Consider the following code:

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# Write the classes and methods that will be necessary to make this code run, and print the following output:

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
## The order of the output does not matter, so long as all of the information is presented.
#
class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Shelter
  def initialize
    @shelters = {}
  end

  def adopt(owner, pet)
    @shelters[owner.name].nil? ? @shelters[owner.name] = [pet] : @shelters[owner.name] << pet
  end

  def print_adoptions
    puts ''
    @shelters.each do |owner_name, pets|
      puts "#{owner_name} has adopted the following pets:"
      pets.each do |pet|
        puts "a #{pet.type} named #{pet.name}"
      end
      puts '-'*5
      puts "#{owner_name} has #{pets.count} adopted pets."
      puts '=='*5
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions