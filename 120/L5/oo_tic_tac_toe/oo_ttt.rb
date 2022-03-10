require 'pry'
=begin
1. Description of the problem:
- 2 players,
- 3x3 gird
- 'X' and 'O' moves in slots for each players
- 1 winner and 1 loser
- random start move in a slot
- one line in 3 vertical diagonal or horizontal is a winer
- no lines in 3 and all spaces fill in is a draw

* Nouns
game
players
winners
loser
slot
sign
diagonal
result

* Verbs
- start
- move/selecting
- checking
- end

2. Initial guess organizing verbs into nouns
and do a spike to explore porblem with temoraly code:

- play  - start
        - end
        - game
        - players
        - gird (3x3)

- select - first-player-move
         - slot
         - sign
         - other player move
         - slot
         - sign

-  cheking - status
           - winner? (3 as a line/row)

- end-game - winner
           - loser

**
1. Nouns: board, player, square, grid
   Verbs: - mark/move
          - play

2. Board
   Square
   Player
    - mark/move
    - play

3. Model thougths in CRC cards

=end

class Board
  WINNER_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                         [1, 5, 9], [3, 5, 7], # diagonals
                         [1, 4, 7], [2, 5, 8], [3, 6, 9]] # cols

  attr_accessor :squares, :turn

  def initialize
    reset
  end

  def draw
    puts	''
    puts  just_spaces
    puts  square_rows([1, 2, 3])
    puts  just_spaces
    puts	row_lines
    puts  just_spaces
    puts  square_rows([4, 5, 6])
    puts  just_spaces
    puts	row_lines
    puts  just_spaces
    puts  square_rows([7, 8, 9])
    puts  just_spaces
    puts	''
  end

  def reset
    @squares = {}
    @turn = [:human, :computer].sample
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def set_square_at(key, marker)
    @squares[key.to_i].marker = marker
  end

  def avaliable_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    avaliable_keys.empty?
  end

  def winner?
    return false if marked_nums.nil? || marked_nums.size < 3
    WINNER_COMBINATIONS.any? { |combo| winning_combination?(combo) }
  end

  private

  def get_square_at(key)
    @squares[key]
  end

  def just_spaces
    puts  ' ' * 5 + '|' + ' ' * 5 + '|'
  end

  def row_lines
    '-' * 5 + '+' + '-' * 5 + '+' + '-' * 5
  end

  def square_rows(row_ary)
    ' ' * 2 + (get_square_at(row_ary[0])).to_s + ' ' * 2 + '|' +
      ' ' * 2 + (get_square_at(row_ary[1])).to_s + ' ' * 2 + '|' +
      ' ' * 2 + (get_square_at(row_ary[2])).to_s + ' ' * 2
  end

  def winning_combination?(combo)
    combo.all? do |combo_num|
      marked_nums.any? { |mark_num| mark_num == combo_num }
    end
  end

  def marked_nums
    marker = (turn == :human ? TTTGame::HUMAN_MARKER : TTTGame::COMPUTER_MARKER)
    squares.select { |_, val| val.marker == marker }.keys
  end
end

class Square
  INIT_MARKER = ' '
  attr_accessor :marker

  def initialize(marker=INIT_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INIT_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class Human < Player
end

class Computer < Player
end

class TTTGame
  HUMAN_MARKER        = 'X'
  COMPUTER_MARKER     = 'O'

  attr_reader :board, :human, :computer

  def initialize
    @board 		= Board.new
    @human 		= Human.new(HUMAN_MARKER)
    @computer = Computer.new(COMPUTER_MARKER)
  end

  def play
    display_welcome
    loop do
      display_board
      loop do
        current_player
        break if board.winner? || board.full?
        clear_screen_and_display_board
        switch_turn
      end
      display_result
      break unless play_again?
    end
    display_goodbye
  end

  private

  def clear_screen
    system 'clear'
  end

  def display_welcome
    puts 'welcome to Tic Tac Toe!'
    puts ''
  end

  def display_goodbye
    puts 'Thanks for playing Tic Tac Toe!'
    puts ''
    puts 'Goodbye!'
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_board
    puts "you are #{human.marker}, computer is #{computer.marker}"
    board.draw
  end

  def human_moves
    square = ''
    loop do
      puts 'Choose a square between 1-9: '
      square = gets.chomp
      break if ((1..9).include? square.to_i) && (board.avaliable_keys.include? square.to_i)
      puts 'Sorry, the number is not valid or the square is taken'
      puts "Avaliable squares are #{board.avaliable_keys}"
    end

    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.avaliable_keys.sample, computer.marker)
  end

  def current_player
    board.turn == :human ? human_moves : computer_moves
  end

  def display_result
    clear_screen_and_display_board
    puts '=' * 20
    puts 'The final result :'.upcase
    puts '-' * 20
    if board.winner?
      puts "The winner is #{board.turn}!".upcase
    else
      puts 'The board is full'.upcase
    end
    puts '=' * 20
  end

  def display_play_again_message
    puts "Ok, let's play again!"
    puts ''
  end

  def reset(answer)
    if answer.downcase == 'y'
      board.reset
      clear_screen
      display_play_again_message
      true
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Do you want to play again? Y/N'
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Not a valid option, pleae type 'y' or 'n'"
    end
    reset(answer)
  end

  def switch_turn
    board.turn = (board.turn == :human ? :computer : :human)
  end
end

game = TTTGame.new
game.play
