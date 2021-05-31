#The following code:

# def my_method(array)
#   if array.empty?
#     []
#   elsif
#     array.map do |value|
#       value * value
#     end
#   else
#     [7 * array.first]
#   end
# end


def my_method(array)
  return [] if array.empty?
  array.size > 1 ? array.map { |value| value * value } :  [7 * array.first]
end

p my_method([]) == []
p my_method([3]) == [21]
p my_method([3, 4]) == [9, 16]
p my_method([5, 6, 7]) == [25, 36, 49]
# is expected to print:

#[]
#[21]
#[9, 16]
#[25, 36, 49]
# However, it does not. Obviously, there is a bug. Find and fix the bug,
# then explain why the buggy program printed the results it did.