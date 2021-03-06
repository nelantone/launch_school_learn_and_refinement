require 'pry-byebug'

INIT_MARKER     = ' '
COMPUTER_MARKER = 'O'
PLAYER_MARKER   = 'X'
WINNING_LINES   = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
PLAYER_1        = 'Player'
PLAYER_2        = 'Computer'

total           = { score_com: 0, score_usr: 0, ties: 0, games: 0 }

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts " You are #{PLAYER_MARKER}, #{PLAYER_2} is #{COMPUTER_MARKER} "
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

def joinor(ary_nums, delimiter=',', nexus='or')
  case ary_nums.size
  when 0 then ''
  when 1 then ary_nums.first
  when 2 then ary_nums.join(" #{nexus} ")
  else
    delimit = "#{delimiter} "
    "#{ary_nums[0, ary_nums.size-1].join(delimit)} #{nexus} #{ary_nums[-1]}"
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))} :"
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

def someone_won?(brd, total)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return PLAYER_1
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return PLAYER_2
    end
  end
  nil
end

def output_totals(total)
  system 'clear'
  puts 'RESULTS'.center(15)
  puts '='*15
  prompt "Number of games: #{total[:games]} "
  prompt "computer wins: #{total[:score_com]}"
  prompt "user wins: #{total[:score_usr]}"
  prompt "ties: #{total[:ties]}"
  puts '='*15
end

def display_final_winner(total)
  final_winner = PLAYER_1 if total[:score_usr] == 2
  final_winner = PLAYER_2 if total[:score_com] == 2

  puts '='*15
  puts "The final winner is the #{final_winner}!"
  puts '='*15
end

loop do

  board = initialize_board

  display_board(board)
  output_totals(total)

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board, total) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board, total) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board, total)
    player_win = detect_winner(board)

    player_win == PLAYER_1 ? (total[:score_usr] += 1) : (total[:score_com] += 1)
    prompt "#{player_win} won!"
  else
    total[:ties] += 1
    prompt "It's a tie!"
  end
  total[:games] += 1

  if total[:score_usr] == 2 || total[:score_com] == 2
    display_final_winner(total)
  end

  prompt('Play again? (y or n)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
