# Combining Arrays
# Write a method that takes two Arrays as arguments,
# and returns an Array that contains all of the values
# from the argument Arrays. There should be no duplication
# of values in the returned Array, even if there are
# duplicates in the original Arrays.

# Example

def merge(first_ary, second_ary)
  first_ary.union(second_ary)
end

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Halvsies
# Write a method that takes an Array as an argument,
# and returns two Arrays (as a pair of nested Arrays) that contain the
# first half and second half of the original Array, respectively.
# If the original array contains an odd number of elements, the middle
# element should be placed in the first half Array.

# Examples:

def halvsies(ary)
  middle = (ary.size / 2.0).ceil

  first_ary = ary[0...middle]
  second_ary = ary[middle..ary.size]

  [first_ary, second_ary]
end

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
