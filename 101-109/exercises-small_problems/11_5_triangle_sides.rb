# Triangle Sides
# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides
# must be greater than the length of the longest side, and all sides must
# have lengths greater than 0: if either of these conditions is not satisfied,
# the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as
# arguments, and returns a symbol :equilateral, :isosceles, :scalene,
# or :invalid depending on whether the triangle is equilateral, isosceles,
# scalene, or invalid.

=begin
- Problem understanding:
  - mental model: write a method that takes the length of the 3 sides of a
    triangle and return the type of triangle or invalide if doesn't satisfy
    the conditions.
  - input: 3 integers
  - output: symbol(4 options)
  - rules:
    - explicit:
      - equilateral: 3 sides equal length
      - isosceles: 2 sides equal 3rd different
      - scalene: All 3 sides different
      - valid triangle:
        - sum of the 2 shortest side lengths greater than longest.
        - all all sides must have lengths greater than 0
        - !otherwise the triangle is invalid
    - implicit:
      - we can have floats as input(not only integers)

- Examples(below)
- Data structure:
  array
- Algorithm:
  - intitialize an array with the inputs and convert them into floats
  - sort the array from smaller to greater.
  - check if all inputs are greater than 0 otherwise return :invalid
  - if all sides are equal return :equilateral
  - take the index at 0 and 1 values compare with the last value. if the
    sum of the  2 values is smaller equal than the last, return :invalid
  - if these 2 values are equal, then return :isoceles
  - else return :scalene
- Code:
=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].map(&:to_f)

  if sides.none? { |side| side > 0 } || sides.min(2).sum <= sides.max
    :invalid
  elsif sides.uniq.one?
    :equilateral
  elsif sides.uniq.size == 2
    :isosceles
  else
    :scalene
  end
end

# Triangle Sides
# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# Examples:
# LONG
=begin
* Problem understanding:
  - Problem domain:

  - Mental model:

  - Input:

  - Output:

  - Rules:
    - Explicit:

    - Implicit:

  - Questions:

* Examples:

* Data Structure:
    -

* Algorithm:
  - Main Algorithm:

  - Ideas:

  - Apporach:

  - Higher Level Algorithm(helper methods):

* Code:
//   - Apporach:
//     + initalize `sides` array adding the 3 values and sort the array in ascending order
//       + check if the triangle is valid
//        + Use `some` to find out if we have a zero value then return 'invalid'
//        + sum of the two shortest index0 + inedx1 values  must be greater than the longest
//        +  if the sum of first and second elem is smaller than the third return invalid (as we know we only have 3 elements)
//      +  check if the trianlge is "equilateral"
//        +find if in the array we have a uniq number(size one)
//      +  check if the triangle is isosceles
//         - find if the array we have 2 uniq numbers(size two)
 //     - else
//       - scalene
=end

def triangle(num1,num2,num3)
  sides = [num1,num2,num3]#.sort
  
  if sides.include?(0) || sides.min(2).sum < sides.max
    :invalid    
  elsif sides.uniq.size == 1
    :equilateral
  elsif sides.uniq.size == 2
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
p triangle(3,5,10)  == :invalid    

# Examples:

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
