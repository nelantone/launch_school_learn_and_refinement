=begin
You are given an array that contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

You can assume there is never an empty array and there will always be an integer.
=end

# def sum_consecutives(arr)
#   p arr.slice_when {|first, last| first != last}.to_a
# end

def sum_consecutives(arr)
  result = []
  subary = []

  arr.each_with_index do |num, idx|
    subary << num
    unless arr[idx] == arr[idx+1]
      result << subary
      subary = []
    end
  end
  result.map(&:sum)
end


p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) #== [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]
