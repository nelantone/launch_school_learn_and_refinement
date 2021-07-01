## # Given an array of strings in which each string may or may not contain punctuation, return a copy of the array in which the alphabetical characters are in reverse order, but the punctuation stays in the same place. 

# preserve_punctuation["shan't", "won't", "y'all'rn't", "fixin'", "'eard", "why??", "peter", "rabbit"] == ["tnah's", "tno'w", "t'nrl'la'y", "nixif'", "'drae", "yhw??", "retep", "tibbar"]


=begin
* Algorithm:
  - Main Algorithm:
    - iterate to each element/string of the given array
      - from each element find:
        - the specific puntuation if is present "?" or "'" and reference the return value to `puntuation`.
       - find all the indexes when the char is "'" or "?" with a helper method, then return all indexes into a new array.
       - initialize a varible `reversed_str` and reverse the initial element-sting and
       - define/use a helper method  `new_string_puntuation` with `reversed_str`, `puntuation`, `puntuation_indices` as params/arguments.
    - new_string_puntuation(helper method)
      - transform each char to an array,  iterate this array with the `index`
        - add the puntuation when the index is one of the specific indexes that should have puntuation add in front the specific element "'" or "?"
      - initialize a variable `filtered_string`  removing the puntuation inside
      - initialize a variable counter for the index and a new_string to store the result
        - when the index is part of the puntiation_indices add the specific puntiation
        - otherwise add the char at the specific index to the new_string result and add +1 to the index counter.
        - once we have the collection join all elements of the result.
      - return new_string_puntuation as the result

  - Ideas:

  - Apporach:
    - init a puntuaction indexes array
      - init counts array
      - init reverse char array
     - given the string conver in each chars
     - find out all `'` and specific indexes(helper method)
     - save the indexes and a new array (just the index number
     - initialize a counter
     - create a loop with a counter every iteration add +=1
    - filter the string removing the '`'
    - reverse the string
    - convert the new string into an array of chars
    - when the arry index number is included insert `'`

  - Higher Level Algorithm(helper methods):
    - find_puntuation_idx
    - reverse_string_and_remove_puntuation
    - add_string_puntuation
* Code:
=end

# def preserve_punctuation(ary)
#   puntuaction_indexes = []
#   counts              = []
#   reverse_chars       = []

#   ary.each do |str|
#     str.each_char.with_index do |char, idx|
#       puntuaction_indexes << idx if char.include? ("'")
#     end
#   end
#   puntuaction_indexes

# end

def find_putuation_idx(str, puntuation)
  str.chars.each_index.select { |idx| str[idx] == "#{puntuation}" }
end

# p find_putuation_idx("shan't", "'") == [4]
# p find_putuation_idx("why??", "?") == [3,4]

# reverse_string_and_remove_puntuation("shan't") == "tnahs"

def new_string_puntuation(str, puntuation, puntuation_indices)
  chars            = str.chars
  filtered_string  = str.gsub("#{puntuation}","")
  extend_idx_count = 0
  new_str          = []

  chars.each_index do |idx|
    if puntuation_indices.include?(idx)
      new_str << "#{puntuation}"
    else
      new_str << filtered_string[extend_idx_count]
      extend_idx_count+=1
    end
  end

  new_str.join
end

# p add_string_puntuation("tnahs", [4]) == "tnah's"
# p new_string_puntuation("t'nr'lla'y", "'", [1,5,8]) == "t'nrl'la'y"
# p new_string_puntuation("??yhw", "?", [3,4]) == "yhw??"

# p preserve_punctuation(["shan't", "won't"])
                                                         
def preserve_punctuation(ary)
  ary.map do |str|
    puntuation         = str.include?("'") ? "'" : "?"
    puntuation_indices = find_putuation_idx(str, puntuation)
    reversed_str       = str.reverse

    new_string_puntuation(reversed_str, puntuation, puntuation_indices)
  end
end

p preserve_punctuation(["shan't", "won't", "y'all'rn't", "fixin'", "'eard", "why??", "peter", "rabbit"]) == ["tnah's", "tno'w", "t'nrl'la'y", "nixif'", "'drae", "yhw??", "retep", "tibbar"]

# "shan't"

# callback
# before/after rspec
# method passed as an argument

def preserve_punctuation(arr)
  alphabet = ('a'..'z').to_a

  arr.map do |word|
    punct = []
    letters = []

    word.chars.each_with_index do |char, i|
      if alphabet.include?(char)
        letters << char
      else
        punct << [char, i]
      end
    end

    letters = letters.reverse
    punct.each do |special, i|
      letters.insert(i, special)
    end
    letters.join
  end
end


def find_putuation_idx(str, puntuation)
  str.chars.each_index.select { |idx| str[idx] == "#{puntuation}" }
end


def transform_one(word)
  all_chars = word.chars
  all_letters = word.chars.select do |wrd|
    wrd.match?(/[a-z]/i)
  end.reverse

  string = ""

  all_chars.each do |char|
    if char.match?(/[a-z]/i)
      string << all_letters.shift
    else
      string << char
    end
  end
  string
end

def preserve_punctuation(arr)
  arr.map do |word|
    transform_one(word)
  end
end