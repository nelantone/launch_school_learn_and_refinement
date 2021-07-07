=begin
Given two arrays of strings a1 and a2 return a sorted array r in alphabetical order of the strings of a1 which are substrings of strings of a2.

#Example 1: a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

#Example 2: a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []
=end

# LONG
=begin
* Problem understanding:
  - Mental model:
      - given arr1 and arr2
        - find if an element of array1 is present in some element of array 2 as substring.
        - if is present include the element form arr1 in the result.

  - Input: 2 arys of strings

  - Output: 1 ary of str

  - Rules:
    - Explicit: 
      - resutl is in alphabetical order

    - Implicit:
      - if there is no match, return an empty array 

  - Questions:

* Examples:

* Data Structure:
    - array

* Algorithm:
  - Main Algorithm:
      - iterate from each element of arry1  and found out if is included as substring in any of the elements of arr2.
      - if it is, include the element in the result, otherwise ignore it.
      - Once we have all elements that satisfies the condition sort the collection alphabeticaly

  - Ideas:

  - Apporach:
    - itierate from ary1 using select
    - inside the block pass arry2.
    - find out of ary is included substring, in some of the elements
    - join all elements of array2 and find if it matches,
    - if matches select the arr1 element.
    - return the selected present elements and return hem as result.

  - Higher Level Algorithm(helper methods):

* Code:
=end

# My solution
def substrings(arr1, arr2)
   arr1.select { |substring| arr2.join(' ').match?("#{substring}") }.sort
end

# Missy solution
# def substrings(arr1, arr2)
#   arr1.select do |arr1_elem|
#     arr2.any? { |elem| elem.include?(arr1_elem) }
#   end.sort
# end

p substrings(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
p substrings(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []
p substrings(["delta", "gamma", "alpha", "beta"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) #== ["alpha", "beta", "gamma"]
p substrings(["albe", "negam"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) == []