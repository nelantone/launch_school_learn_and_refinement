# You are given an array which contains only integers (positive and negative).
# Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

# You can asume there is never an empty array and there will always be an integer.

=begin
* Problem understanding:
  - Mental model:
    - sum the numbers that are the same and consecutive. otherwise return the number

  - Input: array of numbers(integrr positive or negative)

  - Output: array with the same size or smaller than the input

  - Rules:
    - Explicit:
      - sum only the number that are the same and consecutive

    - Implicit:
      - if the number is not the same just add it in the array

  - Questions:

* Examples:
  [-5,-5,7,7,12,0]
    -5-5=10
    7+7 = 14
    12.. alone
    0 alone
    [10, 14,12, 0 ]
* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - from each element inside array compare the next element.
      - element x if is the same element as next one then sum the element
      - otherwise just add the element in the array

  - Ideas:

  - Apporach:
    + initialize a result array
    + initialize count_continue_equal_elem
    + iterate on each element of the given array with the index
    + compare the element with the next element
     + if is the same add and reassign +1 to count_continue_equal_elem
     + otherwise multiply the element from `count_continue_equal_elem` and appen the result inside result array
     + once is appened reasign sum_of_equal_el_times to 1 to start counting again

  - Higher Level Algorithm(helper methods):

* Code:
=end
def sum_consecutives(ary)
  result                    = []
  count_continue_equal_elem = 1

  ary.each_with_index do |el, idx|
    if el == ary[idx+1]
      count_continue_equal_elem += 1
    else
      result << el * count_continue_equal_elem
      count_continue_equal_elem = 1
    end
  end
  result
end

p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

def sum_consecutives(ary)
  result          = []
  current_sum_ary = [ary.first]
  
  1.upto(ary.size) do |idx|
     if current_sum_ary.include? ary[idx]
       current_sum_ary << ary[idx]
      else
       result << current_sum_ary.sum
       current_sum_ary = [ary[idx]]
     end
  end
  result
end
  
p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]