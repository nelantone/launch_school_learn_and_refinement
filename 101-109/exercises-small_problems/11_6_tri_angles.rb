# A triangle is classified as follows:

# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees,
# and all angles must be greater than 0: if either of these conditions is not
# satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and returns
# a symbol :right, :acute, :obtuse, or :invalid depending on whether the
# triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about floating
# point errors. You may also assume that the arguments are specified in degrees.

=begin
  - Problem understanding:
    - mental model: write a method that takes 3 angles as arguments and returns
     a symbol :right, :acute, :obtuse, or :invalid depending the case.
    - input: 3 integers
    - output: symbol
    - rules:
      - explicit:
        -to be a valid triangle:
          - 1+2+3 = 180degrees
          - all greater than 0
         *otherwise :invalid.
        - triangle classification:
           - right: 1 angle 90 degrees
           - acute: 1+2+3 < 90 degrees
           - obtuse: 1 angle greater than 90
           - Examples (below)
      - implicit:
        - all inputs are integers
  - Examples(below)
  - Data structure:
     array
  - Algorithm:
    - create an array with all the inputs
    - validate is a triangle:
       1+2+3 = 180degrees & all greater than 0
     * else :invalid
    - find classification one by one
        - right: any angle? 90 degrees
        - acute: sum angles < 90 degrees?
        - obtuse: 1 angle > 90
  - Code:
=end

# Examples:
def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  if angles.sum != 180 || angles.any? { |x| x <= 0 }
    :invalid
  elsif angles.any? 90
    :right
  elsif angles.all? { |angle| angle < 90 }
    :acute
  elsif angles.one? { |angle| angle > 90 }
    :obtuse
  end
end

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid
