## Re-do
# Keeping score to 10 points.
# Whoever reaches 10 points first wins. Can you build this functionality?
# We have a new noun -- a score.
# Is that a new class, or a state of an existing class?
# You can explore both options and see which one works better.
class Score
  attr_accessor :count

  def initialize(count)
    @count = count
  end
end

class Player
  attr_accessor :move
end

class Move
  HASH_VALUES = { 'p' => 'paper', 's' => 'scissor', 'r' => 'rock' }
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def wins(other_move)
    value == 'paper' && other_move.value == 'rock' ||
      value == 'scissor' && other_move.value == 'paper' ||
      value == 'rock'    && other_move.value == 'scissor'
  end

  def to_s
    @value
  end
end

class User < Player
  attr_reader :name, :points

  def initialize
    @name = ''
    @points = Score.new(0)
  end

  def name=(name)
    @name = name == '' ? 'human' : name
  end

  def points=(points)
    # score = Score.new.count
    @points = Score.new(points)
  end

  def choose_name(name)
    return unless name == ''
    puts "Please write your player-name, otherwise will be 'human'"
    name = gets.chomp
    self.name = name
  end

  def choose
    choose_name(name)
    choice = nil
    loop do
      puts "please choose 'p' for paper,'s' for scissors or 'r' for rock"
      choice = gets.chomp
      break if Move::HASH_VALUES.keys.include? choice.downcase
    end
    choice = Move::HASH_VALUES[choice.downcase]
    self.move = Move.new(choice)
  end
end

class Computer < Player
  attr_reader :name, :points

  def initialize
    @name = 'computer'
    @points = Score.new(0)
  end

  def choose
    choice = Move::HASH_VALUES.values.sample
    self.move = Move.new(choice)
  end

  def points=(points)
    # score = Score.new.count
    @points = Score.new(points)
  end
end

class RPSGame
  TOTAL_ROUNDS = 3
  @@count_rounds = 0
  attr_accessor :human, :computer

  def initialize(_computer)
    @human    = User.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors'
  end

  def display_players_moves
    puts "#{human.name} move is : #{human.move}"
    puts "computer move is : #{computer.move}"
    puts '---'
  end

  def display_round_winner
    computer_move = computer.move
    human_move    = human.move
    if    human_move.wins(computer_move)
      puts "#{human.name} wins!"
      human.points.count += 1
    elsif computer_move.wins(human_move)
      puts 'computer wins!'
      computer.points.count += 1
    else
      puts "it's a draw!"
    end
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors. Good Bye!'
  end

  def stop_playing?
    puts ''
    answer = nil
    loop do
      puts 'Do you want to play again? (y/n)'
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "please  type 'y' or 'n'"
    end
    answer.downcase == 'n'
  end

  def display
    puts ''
    puts "#{human.name} : #{human.points.count}"
    puts "computer : #{computer.points.count}"
    puts '============================='
  end

  def display_rounds_and_status
    puts ''
    puts "number of rounds at the moment: #{@@count_rounds}"
    puts '====== current score: ======='
    display
  end

  def final_result
    system('clear')
    puts ''
    winner = human.points.count == 3 ? human.name : computer.name
    puts '====== FINAL RESULT ======'
    puts "Later #{@@count_rounds} rounds"
    puts "The final winner is #{winner} !"
    display
    puts ''
  end

  def clear_rounds_and_scores
    @@count_rounds        = 0
    computer.points.count = 0
    human.points.count    = 0
  end

  def final_winner
    if [computer.points.count, human.points.count].include? TOTAL_ROUNDS
      final_result
      clear_rounds_and_scores
      stop_playing?
    else
      display_rounds_and_status
      false
    end
  end

  def play
    display_welcome_message
    loop do
      @@count_rounds += 1
      @human_move = human.choose
      @computer_move = computer.choose
      display_players_moves
      display_round_winner
      break if final_winner
    end
    display_goodbye_message
  end
end

RPSGame.new('bob').play

=begin
** Class Player/Computer
is this design, with Human and Computer sub-classes, better? Why, or why not?
Is more encapsulation and more DRY
what is the primary improvement of this new design?
less code repetition and conditionals
what is the primary drawback of this new design?
can be confussing the first time because you need to see Player to find the
constant CHOICE and moves. Appart of that I don't see any inconvenient.

** Comparison logic.
Compare this design with the one in the previous assignment:
what is the primary improvement of this new design?
- It is more object oriented and rules logic is fully encapsulated appart
what is the primary drawback of this new design?
- It is more complex to understand deeply but easier to read.
=end
