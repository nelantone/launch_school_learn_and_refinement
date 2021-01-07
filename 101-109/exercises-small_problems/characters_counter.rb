=begin
PEDAC
- Problem understanding
  - problem domain: /
  - implicit:
    -input: /
    -output: /
  - explicit
    -input: string
    -output: string
  - rules: Spaces should not be counted as a character.
  - clarifying questions: /
  - mendal model: /
- Examples and test
Please write word or multiple words:
>> walk
>> => There are 4 characters in "walk".
- Data structure
- Algorithm
  count characters without the spaces
- Code:
=end
puts "Please write word or multiple words:"
words = gets.chomp
char_count = words.delete(' ').size
puts "There are #{char_count} characters in \"#{words}\"."
