puts 'What is your age?'
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retiring_age = gets.chomp.to_i

current_year = Time.now.year
pending_years_of_work_from_now = retiring_age - age
year_of_retirement = current_year + pending_years_of_work_from_now

puts "It's #{current_year} You will retire in #{year_of_retirement}"
puts "You have only #{pending_years_of_work_from_now} years of work to go!"
