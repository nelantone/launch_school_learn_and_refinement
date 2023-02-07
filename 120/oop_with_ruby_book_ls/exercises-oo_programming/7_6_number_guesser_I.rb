# Number Guesser Part 1
# Create an object-oriented number guessing class for numbers in
# the range 1 to 100, with a limit of 7 guesses per game.
# The game should play like this:

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!
# Note that a game object should start a new game with a new number to guess with each call to #play.

# Show Solution & Discussion
#  Watch  Mark this exercise as complete  Go to the next exercise
# Add your unique solution below
# We want to invite you to contribute your unique solution or analysis. The goal here is to showcase the variety of ways in which this exercise can be solved, and the various tradeoffs one has to consider when working to a solution. Please do not submit redundant solutions, or solutions you haven't tested, or solutions that contain errors. It's not mandatory that you submit a solution. If you do, make sure it's a somewhat good solution that may be useful to others who are learning.

# Use the form below to add your solution or analysis for this exercise. You can include a link to a gist or pastebin, or write your entire solution right here. Make sure to use proper formatting so your code shows up correctly and preview your code first. You may include some commentary about your code and the tradeoffs you took, or some analysis about this exercise and its solutions. Make sure your solution fulfills all of the provided examples, if any, and doesn't contain any obvious errors.

# Don't use the form below to ask questions or make suggestions about the exercise. If you have a question, ask in our Community Forums. If you found an error or have a suggestion, use the Feedback form on the right side of this page.
TOTAL_GUESSES = 7
RANGE         = (1..100).to_a

class GuessingGame
  def initialize
    @sample_num = RANGE.sample
  end

  def play
    num_guesses = TOTAL_GUESSES + 1
    loop do
      num_guesses -= 1
      if num_guesses == 0
        puts 'You have no more guesses.'
        puts "The number was: #{@sample_num}"
        break 'You lost!'
      end
      puts "You have #{num_guesses} guesses remaining."
      puts "Enter a number between 1 and 100:"
      num = gets.chomp.to_i
      if RANGE.include?(num)
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

game = GuessingGame.new
game.play
