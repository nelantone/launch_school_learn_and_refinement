# Return the sum of the integers inside the strings

# LONG
=begin
* Problem understanding:
  - Mental model:
   find the numbers form each word conver them as integers and return the result sum

  - Input: string

  - Output: integer

  - Rules:
    - Explicit:
        - 

    - Implicit:
      - the continue number-strings are take as a digits together
      
  - Questions:

* Examples:
  "55a80" -> [55,80]

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
      - extract all number-string from each word(split the string with each space)
      - transform the number_strings and return the sum

  - Ideas:

  - Apporach:

  - Higher Level Algorithm(helper methods):
    + init result arry
    + split the str with speces into words
    + iterate to each word and extract the numbers in an array
    - append each numbes array in the result
    - flattern the result
    - sum the total

* Code:
=end
def sum_ints(str)
  result = []

  str.split(' ').each { |word| result << word.split(/[a-z]/i).map(&:to_i) }

  result.map(&:sum).sum
end



p sum_ints("1some adj2asdhj9 have0 xy3z") == 15
p sum_ints("he110 NA66ers, HAV3 5ome fun and le7 7ime f1y") == 199
p sum_ints("A10n50 L0ba7o") == 67
p sum_ints('11a1 4tt6') == 22
