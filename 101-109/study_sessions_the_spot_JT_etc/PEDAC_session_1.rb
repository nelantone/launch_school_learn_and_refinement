# Define a method that removes duplicates from an array of numbers. Return the new array with the duplicates removed. The order of the sequence has to stay the same.  
  
# Note: don't use ruby built-in Array#uniq method

# Notes:
# - fundamentals - loop/iterating
# - no sorting - same order as it comes in the array 




=begin
#### P (understand the Problem)
- Of a given array, find the duplicate objs and remove them. Return a new array without the duplicates

#### E (Examples - Test cases)


#### D (Data structures)
Input: Array with integers

Output: New array object 


#### R (Rules + Requirements List)
- define a method: distinct
- return a new array
- Implicitly: all integers 
- dont mutate the arg
- If there are no duplicates, just return the array as is
- the order that it comes in, its the same as it goes into new array
- no duplicates in the return array
- loop from index 0 .. -1
- cannot use #uniq


Algorithm
define a method: distinct


C, L: create [], looping, testing, add to new [], return []

PSEUDOCODE
- Define distinct method that takes an arr of ints as arg (og_arr) 
- Initialise a var result_arr equals to [] 

- Declare a var counter equal to 0
- set up a loop (lines 57 - 63)
  - the first object of the collection will be present 
      - we will check that the object is not present on result_arr(.include)
      if the object is not included in the result_arr we append it
      if the object is included we jump to the next object integer

      counter += 1
      break if counter == og_arr.length

return result_arr
=end
    

def distinct(arr)
  result_arr = []
  counter = 0
  
  loop do
    
    current_item = arr[counter]
    
    if result_arr.include?(current_item)
      next
    else
      result_arr << arr[counter]
    end
    
    counter += 1
    
    break if counter == arr.length
  end
  
  result_arr
end


# p distinct([1]) == [1]
# p distinct([1, 2]) == [1, 2] 
# p distinct([1, 1, 2]) == [1, 2]
p distinct([1, 1, 1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
# p distinct([1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 7, 7]) == [1, 2, 3, 4, 5, 6, 7]
# p distinct([1, 3, 2, 1]) == [1, 3, 2]