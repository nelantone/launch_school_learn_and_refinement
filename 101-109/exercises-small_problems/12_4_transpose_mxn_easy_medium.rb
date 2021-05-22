=begin
Transpose MxN
In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.

Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be transposed by simply switching columns with rows.

Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

Examples:
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
ary[0][0]
ary[1][0]
ary[2][0]


]
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
=end



=begin
* Problem understanding:
  - Problem domain:
    - traspose: change lines for columns

  - Mental model:
     change different size of array lines to columns and vicebersa

  - Input: array/nested-array

  - Output: nested_array/array

  - Rules:
    - Explicit:
        neeed to be at least one row and column

    - Implicit:
     - when is one subarray in the nested array just add each element inside an an array
     - for a double nested subarray

  - Questions:

* Examples:

* Data Structure:
    -

* Algorithm:
  - Main Algorithm:
      + initialize result and subaray
      + assign new_lines as the size of the first subarray
      + assign new cols as the size of the array
      + iterate first from each new line(as we want from the fist line each col/element)
      + iterate inside the lines with each cols/element
      + inside the colss/element use the array to find the col-lines elements
      + append each element to subarray
      + append subarray to result
      + reassign subary to [](to start all over)
      +close the new_lines block and return result
  - Ideas:

  - Methods to use:
    - Basic methods:

    - Direct methods:

  - Apporach:

  - Higher Level Algorithm(helper methods):

* Code:
=end

def transpose(ary)
  result    = []
  subary    = []
  new_lines = ary.first
  new_cols  = ary.size

  new_lines.each_index do |lines|
     new_cols.times { |col| subary << ary[col][lines] }
     result << subary
     subary = []
  end
  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
[[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]