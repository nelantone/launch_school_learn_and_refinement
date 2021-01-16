# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

WORD_NUMBERS = %w(zero one two three four five six seven eight
                  nine ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

numbers = (0..19).to_a

def alphabetic_number_sort(numbers)
  word_num_to_i = {}

  numbers.each { |integer| word_num_to_i[WORD_NUMBERS[integer]] = integer }

  WORD_NUMBERS.sort.map { |word_num| word_num_to_i[word_num] }
end

def alphabetic_number_sort(numbers_a)
  (numbers_a).sort do |a, b|
    WORD_NUMBERS[a] <=> WORD_NUMBERS[b]
  end
end

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
