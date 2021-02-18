# Now I Know My ABCs
# A collection of spelling blocks has two letters per block, as shown in this
# list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.

# Examples:
=begin
- Problem understanding:
  - mental model:
    based on the specific rules (onle can use one letter per block and once)
    evaluate if the word passed as argument.
  - input: string
  - output: boolean
  - rules:
    - explicit:
      - Words you can spell with the blocks to just those words that
         do not use both letters from any given block
      - Each block can only be used once
    - implicit:
      - case insensitive but using uppercase(see last example)
      - string only contain letters(no special chars)
- Examples(below)
- Data structure:
    - an array or hash collection
- Algorithm:
  - initialize a spelling_block_pairs hash with true as key and each block
    as array value
  - split the string to each char.
  - if the char is present in one block change the `key` to `false`
  - in case we have one that is already false return false and stop iterating
- Code:
=end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def add_pair_of(char)
  index_at = 0

  BLOCKS.each_with_index { |pair, idx| index_at = idx if pair.include?(char) }

  BLOCKS[index_at]
end

def block_word?(string)
  str_chars  = string.upcase.chars
  used_pairs = str_chars.shift

  str_chars.each do |char|
    used_pairs.include?(char) ? (return false) : used_pairs << add_pair_of(char)
  end

  true
end

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
