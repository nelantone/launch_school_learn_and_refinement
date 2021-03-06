require 'pry-byebug'

INIT_MARKER     = ' '
COMPUTER_MARKER = 'O'
PLAYER_MARKER   = 'X'
WINNING_LINES   = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts " You are #{PLAYER_MARKER}, computer is #{COMPUTER_MARKER} "
  puts "     |     |"
  puts "   #{brd[1]} |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts " ---------------"
  puts "     |     |"
  puts "   #{brd[4]} |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts " ---------------"
  puts "     |     |"
  puts "   #{brd[7]} |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  (1..9).each_with_object({}) { |num, new_board| new_board[num] = INIT_MARKER }
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INIT_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{empty_squares(brd).join(', ')}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    puts "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  board = initialize_board

  display_board(board)

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt('Play again? (y or n)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
