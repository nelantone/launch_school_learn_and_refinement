VALID_CHOICES = ['paper', 'scissor', 'rock', 'lizard', 'spock']
VALID_SHORT_CHOICES = [:p, :s, :r, :l, :k]
FINAL_WINNER_TIMES = 5
@times_winning_computer = 0
@times_winning_you = 0
@hash_choices = {}

VALID_SHORT_CHOICES.each_with_index do |choice, index|
  @hash_choices[choice] = VALID_CHOICES[index]
end

def prompt(message)
  Kernel.puts(">> #{message}")
end

def paper_wins(first, second)
  first == 'paper' && second == 'rock' ||
    first == 'paper' && second == 'spock'
end

def scissor_wins(first, second)
  first == 'scissor' && second == 'paper' ||
    first == 'scissor' && second == 'lizard'
end

def rock_wins(first, second)
  first == 'rock' && second == 'scissor' ||
    first == 'rock' && second == 'lizard'
end

def lizard_wins(first, second)
  first == 'lizard' && second == 'paper' ||
    first == 'lizard' && second == 'spock'
end

def spock_wins(first, second)
  first == 'spock' && second == 'rock' ||
    first == 'spock' && second == 'scissor'
end

def wins_first(first, second)
  paper_wins(first, second) ||
    scissor_wins(first, second) ||
    rock_wins(first, second) ||
    lizard_wins(first, second) ||
    spock_wins(first, second)
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

def total_wins_counter(computer_choice, choice)
  if wins_first(computer_choice, choice)
    @times_winning_computer += 1
  elsif wins_first(choice, computer_choice)
    @times_winning_you += 1
  end
end

def total_wins_display
  if @times_winning_computer == 5
    Kernel.puts("The Computer is the final winner!!".upcase)
    Kernel.puts("#{@times_winning_computer} VS you #{@times_winning_you} times")
  elsif @times_winning_you == 5
    Kernel.puts("you are the final winner!!".upcase)
    Kernel.puts("#{@times_winning_you} VS computer #{@times_winning_computer} times")
  else
    Kernel.puts('--------------------')
    Kernel.puts("the computer won: #{@times_winning_computer} times")
    Kernel.puts("you won: #{@times_winning_you} times")
    Kernel.puts('--------------------')
    Kernel.puts("the final winner needs to win #{FINAL_WINNER_TIMES} times:")
  end
end

Kernel.puts("=== welcome to #{VALID_CHOICES.join(', ')} ===".upcase)
choice = ''

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("Or also: #{VALID_SHORT_CHOICES.join(', ')}")

    choice = Kernel.gets().chomp().downcase

    if VALID_SHORT_CHOICES.include?(choice.to_sym)
      choice = @hash_choices[choice.to_sym]
    end

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

  total_wins_counter(computer_choice, choice)
  total_wins_display

  prompt("Do you want to play again? 'Y'")
  play_again = Kernel.gets().chomp().downcase
  break unless play_again == 'y'
end

prompt("Thank your for playing, good bye!")
