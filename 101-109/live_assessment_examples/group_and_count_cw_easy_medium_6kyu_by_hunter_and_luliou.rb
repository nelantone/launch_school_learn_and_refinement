# Your goal is to write the group_and_count method, which should receive an array
# as a unique parameter and return a hash. Empty or nil input must return nil instead of a hash.
# This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

# Example usage:

def group_and_count(ary)
  return nil if ary.nil? || ary.empty?
  result = ary.tally
end

input = [1,1,2,2,2,3]
p group_and_count(input) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}


# ** inverse the key-array solution

# def group_and_count_inverse(ary)
#   return nil if ary.nil? || ary.empty?
#   result = ary.tally
#   new_hash = {}
#   old_keys = result.keys
#   result.values.each_with_index do |nw_key,idx|
#     new_hash[nw_key] = old_keys[idx]
#   end
#   new_hash
# end

# or
def group_and_count_inverse(ary)
  return nil if ary.nil? || ary.empty?
  result = ary.tally
  result.map(&:reverse).to_h
end

# input = [1,1,2,2,2,3]

# group_and_count(input)# == {1=>2, 2=>3, 3=>1}

# The following methods are disabled: Array#count and Array#length

p group_and_count_inverse([1,1,2,2,2,3]) == {2=>1, 3=>2, 1=>3}
p group_and_count_inverse([]) == nil
p group_and_count_inverse(nil) == nil
## p group_and_count([1, 7, 5, -1]) == {1=>1, 1=>7, 1=>5, 1=>-1}
