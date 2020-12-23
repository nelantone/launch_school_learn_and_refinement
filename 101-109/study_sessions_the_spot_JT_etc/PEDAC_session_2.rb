=begin

Write a method that takes a string as an argument and groups the number of time each character appears in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically. You should ignore spaces, special characters and count uppercase letters as lowercase ones
Notes:
string input, ouput hash
Key: integer
   - sorted descending (high to low)
values: letters + number (string) based on occurence
  - sorted alphab. (letters)
  - number comes first
  - in an array, not nested

clarifications;
- ignored special ' ', non aphabetical
- lowercase all the values
- number string come first - ASCII value/ordinal table
- return empty hash if no k/v to add

Algo

not mutate the arg

downcase the input

turn the string into an array of characters

find the special characters (invalid) and exclude these

letters and numbers - are valid

-> clean_string of the input

iteration

counting the number of repetion (key)
array for collecting valid chars (value)

initialize an {}

1. define the method get_char_count

2. initialize the empty hash char_count

3. array_to_process: arg.downcase.chars

4. clean the string:
Define valid_chars:
   - regex [a-z0-9]
   - range object ('a'..'z') + ('0'..'9')

5. iterate through array_to_process #select
   -- exclude invalid chars -> return array of valid
   arra_to_process.select do |char|
    char equals to range  - see if its included

array_to_process.delete('^a-z0-9')

6. loop through the array_to_process |char|
    char_count.values.flatten.include?(char)
    check if char is included in some of the value arrays
    in case is included is already counted and we will jump to the next char.

7. in case is not included we want to count the number of chars

8. when we know the number of chars we want to see if the number of chars
represented as key exists.
- In case it exists we append the char inside array related to this key
- In case it doesn't exist we create the array with the key inside
we repate this process for each item

9. Once we finish appending each character to the number or repetitions as key
  we want to sort the array of values inside each key in alphabetical order

=end

def exclude_invalid_chars(input_string)
  ary_downcased = input_string.downcase.chars
  ary_downcased.select! { |char| char.match?(/[a-z]|[0-9]/) }
  ary_downcased
end

def append_or_set_in_count(key, value, hash_counter)
  if hash_counter.key?(key)
    hash_counter[key] << value
  else
    hash_counter[key] = [value]
  end
end

def sort_values(hash_counter)
  hash_counter.map { |_, value| value.sort! }
  hash_counter
end

def get_char_count(input_s)
  char_count = {}
  ary_char = exclude_invalid_chars(input_s)

  ary_char.each do |char|
    unless char_count.values.flatten.include?(char)
      key = ary_char.count(char)

      append_or_set_in_count(key, char, char_count)
    end
  end

  sort_values(char_count)
end

p get_char_count("cba") == { 1 => ["a", "b", "c"] }
p get_char_count("Mississippi") == { 4 => ["i", "s"], 2 => ["p"], 1 => ["m"] }
p get_char_count("Hello. Hello? HELLO!!") == { 6 => ["l"], 3 => ["e", "h", "o"] }
p get_char_count("abc123") == { 1 => ["1", "2", "3", "a", "b", "c"] }
p get_char_count("aaa...bb...c!") == { 3 => ["a"], 2 => ["b"], 1 => ["c"] }
p get_char_count("aaabbbccc") == { 3 => ["a", "b", "c"] }
p get_char_count("") == {}
