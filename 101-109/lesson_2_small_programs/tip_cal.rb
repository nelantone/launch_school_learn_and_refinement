puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
tip_percent = gets.chomp.to_f
puts "with #{tip_percent}%"
total_tip = (tip_percent / 100 * bill).round(2)
total_bill = (total_tip + bill).round(2)
puts "The tip is $#{total_tip}"
puts "The total is $#{total_bill}"
