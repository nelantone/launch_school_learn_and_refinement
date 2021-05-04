# Capitalize every second character of every third word.

=begin
* Problem understanding:
  - Mental model:
    - Capitalize every second character of every third word

  - Input: string

  - Output: str

  - Rules:
    - Explicit:

    - Implicit:
      - when there is no second char, nothing happens.

  - Questions:
    - wht would happen if the  third word, seocnd char is already capitalized? For now we don't care about it.

* Examples:
  -"It is a"... => "It is a".
  - "Lorem Ipsum is" => "Lorem Ipsum iS" (second char is one index at)
* Data Structure:
    - array?

* Algorithm:
  - Main Algorithm:
    - I wan to start form 1 instead zero.
    -  split each word in an array of elemenets
    - find each thir third element.
      - we intitialuze the counter in 2 use a counter adding +3.  -the firstthird element is idx 2.
        idx2 +1  %  3 == 0
       idx+1 % 3 == 0
    - Upcase the second char if there is second char.

  - Ideas:


  - Higher Level Algorithm(helper methods):
    - words

* Code:
=end


# index = 2
#   loop do
#     arr = str.split
#     arr[index] --> THIRD WORD
#     index += 3
#   end

## if index + 1 is a multiple of 3 -- then it's my third word
## when I fid the third word, I need to find every second character
## index of the word - i need to start at index 1 and increment by 2

def to_weird_case(str)
  result =[]
  str.split.each_with_index do |word, w_idx|
    if (w_idx+1) % 3 == 0
      word.chars.each_with_index do |char, c_idx|
        word[c_idx] = word[c_idx].capitalize if c_idx.odd?
      end
    end
    result << word
  end
  result.join(' ')
end

p to_weird_case("Lorem Ipsum is simply dummy text of the printing") == "Lorem Ipsum iS simply dummy tExT of the pRiNtInG"
p to_weird_case("It is a long established fact that a reader will be distracted") == "It is a long established fAcT that a rEaDeR will be dIsTrAcTeD"
p to_weird_case("aaA bB c") == "aaA bB c"
p to_weird_case("Miss Mary Poppins word is supercalifragilisticexpialidocious") == "Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"

# hunter approach
# def to_weird_case(str)
#   groups = str.split.each_slice(3).to_a
#   groups = groups.map do |sub_arr|
#     last = sub_arr[-1]
#     last = last.chars.map.with_index do |letter, index|
#       if index.odd?
#         letter.capitalize
#       else
#         letter
#       end
#     end.join
#     sub_arr.pop
#     sub_arr << last
#     sub_arr
#   end
#   groups.flatten.join(" ")
# end