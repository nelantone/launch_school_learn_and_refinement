=begin
Write a method to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

All strings consist of only lower-case English letters.

=end

def common_prefix_candidates(array)
  min_size = array.min { |x, y| x.size <=> y.size }.size # smallest size item as base
  max_common_prefix = array.map { |i| i.slice(0, min_size) } # transform all as the smallest size item
  hash_candidates = {}

  min_size.times do |time|
    max_common_prefix.each do |item|
      if hash_candidates.key?(time)
        hash_candidates[time] << item[0..time]
      else
        hash_candidates[time] = [item[0..time]]
      end
    end
  end
  hash_candidates
end

def longest_common_prefix(array)
  return '' if array.empty?

  result = common_prefix_candidates(array).values.select { |u| u.uniq.size == 1 }
  return '' if result.empty?

  result.max.first
end

# Test Cases
p longest_common_prefix(["flower", "flow", "flight"]) == "fl"
p longest_common_prefix(["dog", "racecar", "car"]) == ""
p longest_common_prefix([]) == ""
