# Bubble SortBubble Sort
# Bubble Sort is one of the simplest sorting algorithms available. It isn't
# an efficient algorithm, but it's a great exercise for student developers.
# In this exercise, you will write a method that does a bubble sort of an Array.

# A bubble sort works by making multiple passes (iterations) through the Array.
# On each pass, each pair of consecutive elements is compared. If the first of
# the two elements is greater than the second, then the two elements are
# swapped. This process is repeated until a complete pass is made without
# performing any swaps; at that point, the Array is completely sorted.

# 6	2	7	1	4	Start: compare 6 > 2? Yes
# 2	6	7	1	4	Exchange
# 2	6	7	1	4	6 > 7? No (no exchange)
# 2	6	7	1	4	7 > 1? Yes
# 2	6	1	7	4	Exchange
# 2	6	1	7	4	7 > 4? Yes
# 2	6	1	4	7	Exchange
# 2	6	1	4	7	2 > 6? No
# 2	6	1	4	7	6 > 1? Yes
# 2	1	6	4	7	Exchange
# 2	1	6	4	7	6 > 4? Yes
# 2	1	4	6	7	Exchange
# 2	1	4	6	7	6 > 7? No
# 2	1	4	6	7	2 > 1? Yes
# 1	2	4	6	7	Exchange
# 1	2	4	6	7	2 > 4? No
# 1	2	4	6	7	4 > 6? No
# 1	2	4	6	7	6 > 7? No
# 1	2	4	6	7	1 > 2? No
# 1	2	4	6	7	2 > 4? No
# 1	2	4	6	7	4 > 6? No
# 1	2	4	6	7	6 > 7? No
# 1	2	4	6	7	No swaps; all done; sorted
# We can stop iterating the first time we make a pass through the array
# without making any swaps; at that point, the entire Array is sorted.

# For further information, including pseudo-code that demonstrates the
# algorithm as well as a minor optimization technique, see the Bubble Sort
# wikipedia page.

# Write a method that takes an Array as an argument, and sorts that Array
# using the bubble sort algorithm as just described. Note that your sort will
# be "in-place"; that is, you will mutate the Array passed as an argument.
# You may assume that the Array contains at least 2 elements.

# Examples

=begin
- Problem understanding:
  - mental model:
    Write a method that takes an Array as an argument sorting the array using
    bubble sort algorithm sorting in place(mutating the array)
  - input: array
  - output: same array but mutated
  - rules:
    - explicit:
      - the input array should be the same as the output(just mutated)
    - implicit:
      - all objects inside the collection can be integers or a word represented
      in a string
      - in case of a string (at least for the examples) can't have a repeated
        first letter.
- Examples (below)
- Data Structure:
  - array using map!(as is it is a transformation/mutation)
- Algorithm:
  - initialize index assigned to zero
  - iterate with each method the array transforming with index_at
  - inside the iteration take the first item
    -  evaluate to integer/string
      - if it is an integer:
        - compare item 0 with item 1
          - if item 0 is greater thann item 1 swap
          - when it isn't compare item 0+1 and item 1+1
          repeat until the end.
      - if is a string take only the first letter of the string
        *see if there are no repeated letter on the next items as first letter?
        sort the sice via asciidary order as the numbers

- Code:

=end

def bubble_sort!(ary)
  idx = 0
  swaps = 0

  until ary[idx + 1].nil? && swaps.zero?
    if ary[idx + 1].nil? # idx is the last object and we restart the iteration
      idx = 0
      swaps = 0
    end

    if ary[idx] > ary[idx + 1]
      ary[idx], ary[idx + 1] = ary[idx + 1], ary[idx]
      swaps += 1
    else
      idx += 1
    end
  end
  ary
end

# Further Exploration
# Note that we did not use the optimization suggested on the Wiki page that
# skips looking at tail elements that we know are already sorted. If your
# solution also skipped this optimization, try modifying your solution so it
# uses that optimization.

def bubble_sort2!(ary)
  idx = 0
  swaps = 0
  swaped = []

  until ary[idx + 1].nil? && swaps.zero?
    if ary[idx + 1].nil? # idx is the last object and we restart the iteration
      idx = 0
      swaps = 0
    end

    if ary[idx] > ary[idx + 1]
      next if swaped.include?([ary[idx], ary[idx + 1]])

      swaped << [ary[idx], ary[idx + 1]]

      ary[idx], ary[idx + 1] = ary[idx + 1], ary[idx]
      swaps += 1
    else
      idx += 1
    end
  end
  ary
end

array = [5, 3]
bubble_sort2!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort2!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sor2t!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
starting = Time.now
bubble_sort!(array)
ending = Time.now
elapsed = ending - starting
elapsed

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
starting = Time.now
bubble_sort2!(array)
ending = Time.now
elapsed = ending - starting
elapsed
