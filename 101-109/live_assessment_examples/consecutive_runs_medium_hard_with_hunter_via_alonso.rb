# Given a certain string, create a hash with each character in string as key and all possible substrings in string starting at each character as value.

=begin
- Problem understanding:
  - mental model:
    - create a hash with key from each of the chars and value as all possible usbstrings inside an array.
- Examples:
    'ab' -> {a => ['a','ab'], b => ['b'] }
- Data Struct:
  - hash
  - array
- Algorithm
  - ideas:
    - take first char and create n array size combinations
      take second ''

  - main algorithm:
    - from the strin have an array of all chars
    - from the string create a substring starting from the index of the char
    - find all possible combinatios form the substring size 1 to substring size

  - detailed alrg
   +  intiialize  a hash `combos`
   + iterate n `times`//or `upto`
  +initialize the index at elment as key and initialize the array as value
   + create a substring from the size each `index_at`
   +  find `each_cons` from 1 to n.substirng.size
   + add from each element the ones that include the key element inside and
     append it to the array value from the specific key.
  - helper mehtods?
    - subarrya size
    - from the subarray do ech cons n subarray times
=end


def consecutive_runs(str)
  combos = {}

  str.size.times do |count|
    key         = str[count]
    combos[key] = []
    subary      = str[count, str.size]

    subary.size.times do |size|
      subary.chars.each_cons(size+1) do |con|
        con_comb = con.join
        combos[key] << con_comb if con_comb.include?(key)
      end
    end
  end
  combos
end


#get all uniq chars sort
#Iterate over above
  #create the key with block param
  # value will be .select {|x| start_with?(bp)}

# def consecutive_runs(str)
#   str = str.chars
#   sub_strings = []
#   counter = 1
#   loop do
#     str.each_cons(counter){|sub_arr| sub_strings << sub_arr.join}
#     break if counter == str.size
#     counter += 1
#   end
#   p sub_strings.group_by{|substring| substring[0]}
# end

p consecutive_runs('ab') == {'a' => ['a','ab'], 'b' => ['b'] }
p consecutive_runs('abcd') == {"a"=>["a", "ab", "abc", "abcd"], "b"=>["b", "bc", "bcd"], "c"=>["c", "cd"], "d"=>["d"]}





