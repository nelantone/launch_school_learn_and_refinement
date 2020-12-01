SQMETERS_TO_SQFEET = 10.7639

def square_meters(length_in_metters, width_in_metters)
  length_in_metters * width_in_metters
end

def square_feet_convert(square_metters)
  (square_metters * SQMETERS_TO_SQFEET).round(2)
end

puts "Enter the length of the room in meters:"
length_in_metters = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width_in_metters = gets.chomp.to_f

sqm = square_meters(length_in_metters, width_in_metters)

puts "The area of the room is #{sqm} square metters" + 
      " (#{square_feet_convert(sqm)} square feet)"

length_in_metters = 10
width_in_metters = 7

sqm = square_meters(length_in_metters, width_in_metters)
p sqm == 70.0
p square_feet_convert(sqm) == square_feet_convert(sqm)