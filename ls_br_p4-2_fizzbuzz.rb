 def fizzbuzz(from,to)
  arr = []
  (from..to).each do |num|
    if num % 3 == 0 && num % 5 == 0
      arr << 'fizzbuzz'
    elsif num % 3 == 0
      arr << 'fizz'
    elsif num % 5 == 0
      arr << 'buzz'
    else
      arr << num
    end
  end
  puts arr.join(', ')
 end
fizzbuzz(1,15)
