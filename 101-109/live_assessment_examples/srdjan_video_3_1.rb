# The maximim sum subarray consits in finding the maximum sum of a contiguous
# subsequence in an array of integers:

# max Sequence: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]
# Easy case is when the array is made up of only positive numbers and the maximum
# sum is the sum of the whole array. If the array is made up of only negative
# numbers, return 0 instead.

# Empty array is considered to have zero greatest sum. Note that the empty array
# is also a valid subarray.

=begin
* Problem understanding:
  - Mental model:
    - find the sum subarray with max total of contigous integers and return the
      total sum as result.

  - Input: an array of integeres

  - Output: integer

  - Rules:
    - Explicit:
      -  when are all positive numbers the total is the sum of the array
      -  if all elements are negative or the array is empty then we return zero

    - Implicit:
      -  in case there is only one positive integer element in the array the
      result is the number itself.
  - Questions:

* Examples:
# max Sequence: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]
* Data Structure:
    - arrays

* Algorithm:
  - Main Algorithm:
   - add next guard clauses:
     -  when are all positive numbers the total is the sum of the array
     - if all elements are negative or the array is empty then we return zero
    combinations
    - we intitalize an results array
    - we iterate the give array starting from size n of the array.
      and we save the sum result in an array.
    - and we repeat the process with -1 as size on each iteration of the possible
    conssecutive results.
    - we are going to use `each_cons` to create consecutive results.
      - [-2, 1, -3, 4, -1, 2, 1, -5, 4]  # s 9
      - [-2, 1, -3, 4, -1, 2, 1, -5], [ 1, -3, 4, -1, 2, 1, -5, 4]  #8
      - [-2, 1, -3, 4, -1, 2, 1], [ 1, -3, 4, -1, 2, 1, -5] ...  s 7
    -  once we have all the possible results, we take the max value and we return it.

  - Ideas:
    - form different size and array element combinations of contiguous
 subsequence elements
    - starting from the biggest combinations make array combinations
      until size 1 elements.

  - Higher Level Algorithm(helper methods):

* Code:
=end
def max_sequence(ary)
  return 0 if ary.empty? || ary.all?(&:negative?)

  all_possible_results = []

  (ary.size).downto(1) do |count_sz|
    ary.each_cons(count_sz) do |result|
      all_possible_results << result
    end
  end

  all_possible_results.map(&:sum).max
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
