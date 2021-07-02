# From a list of numbers find the greatest palindrome substring and return the substring. In case there are different substrings with the same size  return the total as an array in decreasing order

# input: string
# output: hash (integers as key and string as value)


# algorithm:
  # create substrings variations
    # substrings helper method

  # find the greatest palindrome substring from the substrings array
    # check if the word is equal as in reverse order (checking if it is palindrome?)
    # select the greatest palindrome
    # if there are more than one then push them inside an array in decreasing order

  # output the return value as hash  - (integers as key and string as value)
    # initialize an empty hash assign the count of hash as key and the string itself as value


def substrings(string)
  subs = []
  
  0.upto(string.length - 1) do |index|
    2.upto(string.length - index) do |length|
      subs << string[index, length]
    end
  end
  subs
end

def is_palindrome?(string)
  string == string.reverse
end
  

def greatest_palindrome(string)
  result = {}
  string_var = substrings(string)
  
  palindromes = string_var.select { |sub| is_palindrome?(sub) }
  
  sorted_pal = palindromes.sort_by { |str| str.length }.slice_when {|a,b| a.length != b.length }.to_a.last
  
  return "" if sorted_pal.nil?
  
  sorted_pal.each do |str_num|    
    if result[str_num.size].nil?
      result[str_num.size] = [str_num]
    else
       result[str_num.size] << str_num
    end
  end

  if result.values.first .size == 1
    result[result.keys.first] = result.values.first.last 
  else
    result.map do |k,v_ary|
      result[k] = v_ary.sort_by {|v| v[0].to_i }.reverse
    end
  end
  result
end



p greatest_palindrome("12345567890123321023") == { 8 => "01233210"}
p greatest_palindrome("090912343341987077012332") == { 4 => ["4334", "2332","0770"]}
p greatest_palindrome("091234198701231") == ""