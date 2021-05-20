# Seeing Stars
# Write a method that displays an 8-pointed star in an nxn grid, where n is
# an odd integer that is supplied as an argument to the method. The smallest
# such star you need to handle is a 7x7 grid.

=begin
* Problem understanding:
  - Problem domain:
    display an star in a n x n grid
  - Mental model:

  - Input:

  - Output:

  - Rules:
    - Explicit:
      - n is an odd integer
      - smallest possible star is 7 grid

    - Implicit:

  - Questions:

* Examples:
star(7)
  1234567
1 *  *  *  star[0,3,6] none[1,2,4,5]
2  * * *   star[1,3,5] none[0,2,4]
3   ***    star[2,3,4] none[0,1,5,6]
4 *******  star[0,1,2,3,4,5,6] none[]
5   ***
6  * * *
7 *  *  *

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
    - from a n x n matrix(odd number greater or equal 7)
    - have 3 stars
    - the lefter/righter star will get +1, -1 on each line closer to the center star
    - when the 3 astars are the most center as possible and together example: index `234`
      then add all stars in the next line(it should be the cetnric line)
    - then next line lefter/rigther stars will start getting far way from the center
    -

  - Ideas:
    - matrix nxn via times
    - "          " via upto

  - Methods to use:
    - Basic methods:
      - time & with index
      - while/until
    - Direct methods:
      - one line reassigment

  - Apporach:
    + use a guard clause to return '' when size is smaller than 7 and/or `even`.
    + create n column size each with n elements
    - the elment in the middle should have n stars and 0 empty strings
    - the n number in the middle is always a star
    - the first and last line should have always star in 0 and n
    - the stars in 0 and n are +1 and -1 respectively until +1 is 1 number smaller
      than the middle index num and -1 is +1 bigger than the middle index number

      - Higher Level Algorithm(helper methods):
       +1 from the left until -1 eql to index center
       -1 from the right until +1 eql to index center
       * then swtich on next line methods to make it far away until last size
       - middle line all stars
* Code:
=end

def lines(line, idx, middle_idx)
  expand = idx - middle_idx

  line.map.with_index do |_, idx|
    idx == middle_idx - expand || idx == middle_idx || idx == middle_idx + expand ? '*' : ' '
  end.join
end

def star(size)
  return p 'Size needs to be greater than 6 and an odd number' if (size < 7) || size.even?
  middle_idx = (size - 1) / 2
  line       = []

  size.times      { line << ' ' }
  line.each_index { |idx| puts idx == middle_idx ? '*' * size : lines(line, idx, middle_idx) }
end

star(7) #== true
star(21)
star(1)
star(8)
star(7) #== true
# star(1) == ''
# star(6) == ''
# star(8) == ''
