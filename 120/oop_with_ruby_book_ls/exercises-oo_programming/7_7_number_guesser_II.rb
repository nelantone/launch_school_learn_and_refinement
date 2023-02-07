# Number Guesser Part 2
# In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives
# the user 7 opportunities to guess the number.

# Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to
# compute a secret number for the game. You should also change the number of guesses allowed so the user can always win
# if she uses a good strategy. You can compute the number of guesses with:

Math.log2(size_of_range).to_i + 1
# Examples:

game = GuessingGame.new(501, 1500)
game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too high.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# That's the number!

# You won!

game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low.

# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low.

# You have no more guesses. You lost!
# TOTAL_GUESSES = Math.log2(size_of_range).to_i + 1
# RANGE         = (1..100).to_a
class GuessingGame
  attr_reader :min_range, :max_range
  def initialize(min_range, max_range)
    @min_range  = min_range
    @max_range  = max_range
    @range = (@min_range..@max_range).to_a
    @sample_num = (@range).to_a.sample
  end

  def play
    num_guesses = Math.log2(@range.size).to_i + 1
    loop do
      num_guesses -= 1
      if num_guesses == 0
        puts 'You have no more guesses.'
        puts "The number was: #{@sample_num}"
        break 'You lost!'
      end
      puts "You have #{num_guesses} guesses remaining."
      puts "Enter a number between #{@min_range} and #{@max_range}:"
      num = gets.chomp.to_i
      if @range.include?(num)
        if @sample_num > num
          puts 'Your guess is too low.'
        elsif @sample_num < num
          puts 'Your guess is too high.'
        else
          puts "That's the number!"
          return 'you won!'
        end
      else
        puts 'Invalid guess. Enter a number between 1 and 100:'
      end
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play 