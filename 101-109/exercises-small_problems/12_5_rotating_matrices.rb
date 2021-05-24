# Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

=begin
* Problem understanding:
  - Mental model:
    - transform each line to column and  from this new column reverse the indexes

  - Input: array/subary

  - Output: array/subary

  - Rules:
    - Implicit:
      - col nums are row num
      - row nums are col num

* Examples:
  [3, 7, 4, 2],
  [5, 1, 0, 8]

  transf:
  1st - [3,5],[7,1],[4,0],[2,8]

  2nd- [5,3],[1,7],[0,4],[8,2]

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - transform each same index at oeach line to a new line
    - then reverse the rsult of each each line.

  - Ideas:

  - Methods to use:
    - Basic methods:

    - Direct methods:

  - Apporach:
    + init new array_ result  ,new_subarray
    + initialize a new_rows variable (shoudl be the same num size of the column)
    + init a new_cols variable(the size of row)
    + as we want first the index at to iterate x times
    + first iterate the new_row(col)
    + then iterate new_col(row/line)
    + then find the matrix new_row index at and new col index at
    + reverse row subary or without mutating the arg(*better)
    + append to a new array(result)
    + have result as return value of the method

  - Higher Level Algorithm(helper methods):
    - transform_row_to_col

* Code:
=end

def rotate90(ary)
  result   = []
  subary   = []
  new_rows = ary.first.size
  new_cols = ary.size

  new_rows.times do |new_row|
    new_cols.times { |new_col| subary << ary[new_col][new_row] }
    result << subary.reverse
    subary = []
  end
  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
