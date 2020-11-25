VALID_CHOICES = ['paper', 'scissor', 'rock']

def test
  prompt('hi')
end

def prompt(message)
  Kernel.puts(">> #{message}")
end

def wins_first(first, second)
  (second == 'paper' && first == 'scissor') ||
    (second == 'scissor' && first == 'rock') ||
    (second == 'rock'    && first == 'paper')
end

def result_display(choice, computer_choice)
  Kernel.puts(" ========= ")
  if wins_first(choice, computer_choice)
    Kernel.puts("You win!".upcase)
  elsif wins_first(computer_choice, choice)
    Kernel.puts("Computer wins!".upcase)
  else
    Kernel.puts("It's a tie!".upcase)
  end
  Kernel.puts(" ========== ")
end

Kernel.puts("=== welcome to #{VALID_CHOICES.join(', ')} ===".upcase)
choice = ''

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("your choice         : #{choice}")
  Kernel.puts
  Kernel.puts("the computer choice : #{computer_choice}")

  result_display(choice, computer_choice)

  prompt("Do you want to play again? 'Y'")
  play_again = Kernel.gets().chomp().downcase
  break unless play_again == 'y'
end

prompt("Thank your for playing, good bye!")
