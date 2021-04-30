=begin
You are given an array (which will have a length of at least 3, but could
be very large) containing integers. The array is either entirely comprised
of odd integers or entirely comprised of even integers except for a single
integer N. Write a method that takes the array as an argument and returns
this "outlier" N.
=end

=begin
* Problem understanding:
  - Mental model:
    - find the odd/even number in the array of evens/odds.
  - Input: array of integers
  - Output: integer
  - Rules:
    - Explicit:
      - all are integers
      - there is always one SINGLE integer who is odd, even
    - Implicit:
     - it can be also negative numbers

  - Questions:
* Examples:
0, 1, 2 -> 0 is odd, 1 is even an 2 is odd, we reutn `1` as the single odd.
160, 3, 1719 -> the first element is the single even element we look for
* Data Structure:
    - array?
* Algorithm:
  - Main Algorithm:
  - Ideas:
    - initialize oddd, even array
    - from the 3 first chars find the different one. or the empty array of
      odd/even
    - we want to check if the odd array is greater than 1.
    - select eh single char that is different and return it as integer


    - any? all?
      - take the first 3 elements and count
        -if there is a different element(odd, even)  counting in1 or 0
        this is the single element type we look for (even/odd?)
  - Higher Level Algorithm(helper methods):
      - single_type
* Code:
=end


# def odd_single?(ary)
#   # odd, even = [], []
#   # ary.each { |n| n.odd? ? odd << n : even << n }
#   # ary.partition(&:even?)
#   ary.partition(&:odd?).first.size <= 1
# end

# # p odd_single?([1,2,3]) == false
# # p odd_single?([1,2,4]) == true

# def find_outlier(ary)
#   odd_single?(ary) ? ary.find(&:odd?) : ary.find(&:even?)
# end

# # find_outlier([0, 1, 2]) == 1
# # find_outlier([0, 1, 2]) == 1

# p find_outlier([0, 1, 2]) == 1
# p find_outlier([1, 2, 3]) == 2
# p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
# p find_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160

# def find_outlier(arr)
#   evens = arr.select(&:even?).count
#   odds = arr.select(&:odd?).count
#   if evens > odds
#     arr.each{|num| return num if num.odd?}
#   else
#     arr.each{|num| return num if num.even?}
#   end
# end

def find_outlier(ary)
  ary.partition(&:odd?).first.size <= 1 ? ary.find(&:odd?) : ary.find(&:even?)
end

p find_outlier([0, 1, 2]) == 1
p find_outlier([1, 2, 3]) == 2
p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p find_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
