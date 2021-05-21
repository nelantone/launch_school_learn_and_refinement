# advaned 1- number 3
# Secon try (by my own)
=begin
Problem Understanding:
- Mental model:
  transpose an 3X3 matrix
- input: matrix/array
- ouput: array

- rules:
  - explicit:
    - don't use `transpose` or/and Matrix class
    - don't modify the original matrix

Example:
  - below
Data struct:
  - array
Algorithm:
  - main algorithm:
    - store all elements at index n in each subarray in a new subarray
    - return the subaray inside an array

  - methods
    - each_with_index

  - pseudocode
    + initialize a result array
    + init t_subary
    + init count(idx_count)
    + iterate the times of the size of the array
    + from each iteration take the element at idx_count and stor each element in the subary
    + store the subary in the result
    + reassign/re-initialize t_subary
    + add +1 in the count to continue to the next index.
    + return the result
=end

#Example
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matrix)
  result    = []
  t_subary  = []
  idx_count = 0

  matrix.size.times do
    matrix.each { |subary| t_subary << subary[idx_count] }
    result << t_subary
    t_subary = []

    idx_count +=1
  end
  result
end


new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


# First try PP with Mia
=begin
Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

Problem:
  - Take index at three nested arrays, use these indices to create new sub-arrays
    - The first array is composed by the elements at index 0 of each sub-array
    - Second array -> index 1 ...and so on
  - Input: matrix with n arrays
  - Output: new matrix with n arrays (same size and same length)
  - There are as many sub-arrays as elements in the original arrays
  - Square matrix (same no. rows and columns)

Data Structure
  - Array

Algorithm
  - create a new array for our final matrix
  - iterate through the main array
    - each element in the first subarray:
      - as 1, 5, 8,
    - we can use each with index
    - specify a range from 0 to 3
      - 1 -> (matrix[0][0], matrix[0][1], matrix[0][2])
      - 5 -> (matrix[1][0], matrix[1][1], matrix[1][2])
    - iterate through that range and withing the iteration
      - Add the element matrix[number_in_range][outer_loop_index]

=end

# def transpose(mtx)
#   transposed_matrix = []
#   mtx[0].each_with_index do |_first_row_elem, idx|
#     sub_arr = []
#     (0..2).each do |num_in_range|
#       sub_arr << mtx[num_in_range][idx]
#     end
#     transposed_matrix << sub_arr
#   end
#   transposed_matrix
# end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
