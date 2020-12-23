loop do
  puts "What is your name?"
  name = gets.chomp

  puts "\n Hello #{name} \n"
  puts ("\n Hello #{name.chop}. Why are we screaming? \n").upcase if name.chars.last == '!'

  puts "\n 'ctl-c to exit' \n \n"
end
