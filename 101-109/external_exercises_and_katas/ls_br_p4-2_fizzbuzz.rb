def fizzbuzz(from, to)
  arr = []
  (from..to).each do |num|
    arr << if (num % 3).zero? && (num % 5).zero?
             'fizzbuzz'
           elsif (num % 3).zero?
             'fizz'
           elsif (num % 5).zero?
             'buzz'
           else
             num
           end
  end
  puts arr.join(', ')
 end
fizzbuzz(1, 15)
