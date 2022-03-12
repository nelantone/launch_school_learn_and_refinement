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

module Joiner
  def collection(ary_nums, separate = ', ', last = 'or')
    if ary_nums.size > 1
      "#{ary_nums[0..-2].join(separate)} #{last} #{ary_nums[-1]}"
    else
      ary_nums.first
    end
  end
end

class Board
  include Joiner
  WINNER_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                         [1, 5, 9], [3, 5, 7], # diagonals
                         [1, 4, 7], [2, 5, 8], [3, 6, 9]] # cols

  MATRIX = [[1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]]

  MARKERS = ['X', 'O']

  attr_accessor :squares, :turn, :human_mark, :computer_mark

  def initialize
    reset
  end

  def draw
    puts	''
    just_spaces
    main_draw
    just_spaces
    puts	''
  end

  def reset
    @squares       = {}
    @turn          = [:human, :computer].sample
    @human_mark    = 'X'
    @computer_mark = 'O'
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def set_square_at(key, marker)
    @squares[key.to_i].marker = marker
  end

  def display_available_keys
    keys = current_keys
    collection(keys)
  end

  def current_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    current_keys.empty?
  end

  def winner?
    return false if marked_nums.nil? || marked_nums.size < 3
    WINNER_COMBINATIONS.any? { |combo| winning_combination?(combo) }
  end

  def choose_mark
    loop do
      puts 'Please choose your mark:'
      collection(MARKERS)
      mark = gets.chomp
      if MARKERS.include? mark.upcase
        self.human_mark    = mark
        self.computer_mark = (human_mark == 'X' ? 'O' : 'X')
        break
      end
      puts "Choose 'X' or 'O'"
    end
  end

  private

  def main_draw
    square_rows(MATRIX[0])
    middle_space
    square_rows(MATRIX[1])
    middle_space
    square_rows(MATRIX[2])
  end

  def get_square_at(key)
    (@squares[key]).to_s
  end

  def just_spaces
    puts ' ' * 5 + '|' + ' ' * 5 + '|'
  end

  def row_lines
    puts '-' * 5 + '+' + '-' * 5 + '+' + '-' * 5
  end

  def square_rows(row_ary)
    puts ' ' * 2 + get_square_at(row_ary[0]) + ' ' * 2 + '|' +
         ' ' * 2 + get_square_at(row_ary[1]) + ' ' * 2 + '|' +
         ' ' * 2 + get_square_at(row_ary[2]) + ' ' * 2
  end

  def middle_space
    just_spaces
    row_lines
    just_spaces
  end

  def winning_combination?(combo)
    combo.all? do |combo_num|
      marked_nums.any? { |mark_num| mark_num == combo_num }
    end
  end

  def marked_nums
    marker = (turn == :human ? human_mark : computer_mark)
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
end

class Human < Player
end

class Computer < Player
end

class TTTGame
  include Joiner

  attr_reader :board, :human, :computer
  attr_accessor :player_name

  def initialize
    @board 		   = Board.new
    @human 		   = Human.new
    @computer = Computer.new
    @player_name = ''
  end

  def play
    clear_screen
    display_welcome
    setup_game
    main_game
    display_goodbye
  end

  private

  def choose_name
    puts 'please choose a player name, otherwise press enter'
    self.player_name = gets.chomp
    self.player_name = 'Player' if player_name == ''
  end

  def setup_game
    choose_name
    board.choose_mark
  end

  def main_game
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
  end

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
    puts "you are #{player_name} ( marker #{board.human_mark}) , computer is #{board.computer_mark}"
    board.draw
  end

  def free_and_valid_square?(square)
    ((1..9).include? square.to_i) && (board.current_keys.include? square.to_i)
  end

  def human_moves
    square = ''
    loop do
      puts "Choose a number-square."
      puts "The free ones are #{board.display_available_keys}"
      square = gets.chomp
      break if free_and_valid_square?(square)
      puts 'Sorry, the number is not valid or the square is taken'
    end

    board.set_square_at(square, board.human_mark)
  end

  def computer_moves
    board.set_square_at(board.current_keys.sample, board.computer_mark)
  end

  def current_player
    board.turn == :human ? human_moves : computer_moves
  end

  def display_the_winner
    print 'The winner is '.upcase
    if board.turn == :human
      print "#{player_name}!".upcase
    else
      print "#{board.turn}!".upcase
    end
  end

  def display_result
    clear_screen_and_display_board
    puts '=' * 20
    puts 'The final result :'.upcase
    puts '-' * 20
    puts ''
    if board.winner?
      display_the_winner
    else
      puts 'The board is full'.upcase
    end
    puts ''
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
