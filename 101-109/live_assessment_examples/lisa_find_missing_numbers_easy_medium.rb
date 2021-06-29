# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.


# LONG
=begin
* Problem understanding:
  - Mental model:
      - return the missing numbers from a range collection

  - Input: ary

  - Output: ary

  - Rules:
    - Explicit: 

    - Implicit:
      - missing element does not need be consecutive
      - hwne there is only on number or not missing numbers then return and empty
      string
      - numbers can be negative
      - all nums are integers
      - we only have nums
       - the numbers/items are always incremental

  - Questions:

* Examples:
([-3, -2, 1, 5] => [-1.0, 2,3,4]

* Data Structure:
    - array/range

* Algorithm:
  - Main Algorithm:
    - from a range si iff all the elements in beteen are present
      - if one o many elements are not add then in the result, otherwise ignore the element.

  - Ideas:

  - Apporach:
    - guard clause, if given aray is equal 1 return `[]` 
    - init reult array
    - add a range form first colllection item to the collect item
    - from each item of the range we created find out if the element is present
      - if is present continue
      - otherwise add the element inside result array
    - return result array.

  - Higher Level Algorithm(helper methods):

* Code:

=end

def missing(ary)
  result = []
  
  (ary.first...ary.last).each { |num| result << num unless ary.include?(num) }
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
