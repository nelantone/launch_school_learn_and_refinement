# Merge Sorted Lists

# Write a method that takes two sorted Arrays as arguments, and returns a
# new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array.
# You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.


# Examples:
=begin
* Problem understanding:
  - Mental model:
    - return a new array sorted merging 2 sorted arrays with all elments.

  - Input: arrays

  - Output: array

  - Rules:
    - Explicit:
      - do not use `sort` or any sort solution
      - do not mutate inputs
      - build result at a time in the proper order
    - Implicit:
      - element/numbers can be repeated
  - Questions:

* Examples:

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
      - compare each sorted array element to each other selecting always the smallest
  - Ideas:
    - create an array with both arrays with all incuded elements
    - take the smallest element of both arrays save it
    - remove the saved element at this index continue with the next one
    - repeat the process until the end.

  - Apporach:

  - Higher Level Algorithm(helper methods):

* Code:
=end

def merge(arr1,arr2)
  result   = []
  new_arr1 = arr1.dup # we avoid `array1` mutation
  new_arry = new_arr1.concat(arr2)

  until new_arry.empty?
    current_min = new_arry.min
    min_index   = new_arry.index(current_min)

    result << current_min

    new_arry = new_arry.reject.with_index {|_,idx| idx == min_index }
  end
  result
end
a = [1, 5, 9]
b = [2, 6, 8]
p merge(a, b) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
p a == [1, 5, 9]
p b == [2, 6, 8]