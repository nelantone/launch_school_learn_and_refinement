
CW -num 57
=begin
Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}

The following methods are disabled: Array#count and Array#length


=end

# LONG
=begin
* Problem understanding:
  - Mental model:
      - find the number of counts that are present in a collection and return the keys as values, and value as values
  - Input:
    -ary

  - Output:
    - hash
    
  - Rules:
    - Explicit:
      - don't use tally

    - Implicit:
      - in case there are more value/digits with the count, append them in an array.
      othewise jsut as numbers
      - when there is nil or an empty array return nil

  - Questions:

* Examples:

* Data Structure:
    - hash

* Algorithm:
  - Main Algorithm:
    - find the all digits form the collection
    - intialize a hash digits_count with the gitis as key (chekc if they are uniq digits)
      - if are uniqe add just 1
      - if ther are not uniq reassign the value to an array
    - return then the result as hash

  - Ideas:

  - Apporach:
    + init hash`digits_count`
    + create an array with the uniq numbers from the collection
    + iterate with uniq elements
    + before init the keys find out if there are uniq inside the array
      + if count if nil init the key.
      + when the crunts haver mmore digit vaules then we have an array to store them
      + ewhen we dont( only one value there is no array)
      
  - Higher Level Algorithm(helper methods):

* Code:
=end
def trans_uniq_val_in_digit(digits_count)
    digits_count.map do |k,v|
    if v.size == 1
      [k,v.first]
    else 
      [k,v]
    end
  end.to_h
end

def  group_and_count(ary)
  return nil if ary.nil? || ary.empty?
  digits_count = {}
  uniq_digits  = ary.uniq
  
  uniq_digits.each do |num|
    count = ary.count(num)
    if digits_count[count].nil?
      digits_count[count] = [num]
    else 
       digits_count[count] << num
    end
  end
  trans_uniq_val_in_digit(digits_count)
end

# [1,1,2,2,2,3].coun(2)

def  group_and_count(arr)
  return nil if arr.nil? || arr.empty?
  
  p hash = arr.group_by{|num| arr.count(num)}
  
  p hash = hash.transform_values{|value| value.uniq}
  
  hash = hash.transform_values do |value|
    if value.size == 1
      value[0] 
    else
      value
    end
  end
  p hash
end

p group_and_count([1,1,2,2,2,3]) == {2=>1, 3=>2, 1=>3}
# p group_and_count([]) == nil
# p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>[1,7,5,-1]}

