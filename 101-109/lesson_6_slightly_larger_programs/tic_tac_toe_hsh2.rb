require 'pry-byebug'

INIT_MARKER    = ' '
O_MARKER       = 'O'
X_MARKER       = 'X'
WINNING_LINES  = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                 [[1, 5, 9], [3, 5, 7]]              # diagonals
PLAYER1        = 'Player'
PLAYER2        = 'Computer'
MOVE_FIRST     = { PLAYER1 => 1, PLAYER2 => 2 }
FINAL_WIN_NUM  = 5
total          = { score_com: 0, score_usr: 0, ties: 0, games: 0 }

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts " You are #{X_MARKER}, #{PLAYER2} is #{O_MARKER} "
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
    "#{ary_nums[0, ary_nums.size - 1].join(delimit)} #{nexus} #{ary_nums[-1]}"
  end
end

def start_player_selection
  prompt "Do you want the computer to move first? (user move first by default)"
  prompt "type 'y' or 'yes' or something else for 'no'"
  choose = gets.chomp
  if choose.downcase.start_with?('y')
    MOVE_FIRST[PLAYER2]
  else
    MOVE_FIRST[PLAYER1]
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
  brd[square] = X_MARKER
end

def computer_defense(brd)
  square_defense = nil

  WINNING_LINES.any? do |line|
    player_marks = brd.values_at(*line).count(X_MARKER)

    if !brd.values_at(*line).index(' ').nil? && (player_marks == 2)
      empty_sq_index = brd.values_at(*line).index(' ')
      square_defense = line[empty_sq_index]
    end
  end
  square_defense
end

def player_close_win?(brd)
  !!computer_defense(brd)
end

def free_oposite_corner(player_position, brd, elem)
  if player_position == 1 && brd[9] == ' '
    square_attack = 9
  elsif player_position == 3 && brd[7] == ' '
    square_attack = 7
  elsif player_position == 7 && brd[3] == ' '
    square_attack = 3
  elsif player_position == 9 && brd[1] == ' '
    square_attack = 1
  end
end

def minimax(brd, line)
  square_attack = nil
  brd.values_at(*line).each_with_index do |elem|
    if !!(elem.index(X_MARKER))
      player_position = line[elem.index(X_MARKER)]
      square_attack   = free_oposite_corner(player_position, brd, elem)
    end
  end
  square_attack
end

def computer_attack(brd)
  square_attack = nil

  WINNING_LINES.any? do |line|
    computer_marks = brd.values_at(*line).count(O_MARKER)
    player_marks   = brd.values_at(*line).count(X_MARKER)
    if brd[5] == ' '
      square_attack = 5
    elsif !brd.values_at(*line).index(' ').nil? && (computer_marks == 2)
      empty_sq_index = brd.values_at(*line).index(' ')
      square_attack = line[empty_sq_index]
    end
  end
  square_attack
end

def computer_close_win?(brd)
  !!computer_attack(brd)
end

def minimax_corners?(brd, line)
  !!minimax(brd, line)
end

def computer_places_piece!(brd)
    square = if computer_close_win?(brd)
              computer_attack(brd)
            elsif player_close_win?(brd)
              computer_defense(brd)
            elsif WINNING_LINES.any? { |line|  minimax_corners?(brd, line) }
              minimax = WINNING_LINES.map { |line| minimax(brd, line) }# WIP
              minimax.select{|a| a.class == Integer }.first
            else
              empty_squares(brd).sample
            end
  brd[square] = O_MARKER
end

def place_piece!(brd, current_player)
  if current_player == PLAYER1
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == PLAYER1 ? PLAYER2 : PLAYER1
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(X_MARKER) == 3
      return PLAYER1
    elsif brd.values_at(*line).count(O_MARKER) == 3
      return PLAYER2
    end
  end
  nil
end

def output_totals(total)
  puts 'RESULTS'.center(15)
  puts '=' * 15
  prompt "Number of games: #{total[:games]} "
  prompt "computer wins: #{total[:score_com]}"
  prompt "user wins: #{total[:score_usr]}"
  prompt "ties: #{total[:ties]}"
  puts '=' * 15
end

def display_final_winner(total)
  final_winner = if total[:score_usr] == FINAL_WIN_NUM
                   PLAYER1
                 else
                   PLAYER2
                 end

  puts '=' * 15
  puts "The final winner is the #{final_winner}!"
  puts '=' * 15
end

def reset_total_result
  { score_com: 0, score_usr: 0, ties: 0, games: 0 }
end

loop do
  board = initialize_board
  current_player = if start_player_selection == 1
                     PLAYER1
                   else
                     PLAYER2
                   end
  loop do
    display_board(board)

    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    player_win = detect_winner(board)

    player_win == PLAYER1 ? (total[:score_usr] += 1) : (total[:score_com] += 1)
    prompt "#{player_win} won!"
  else
    total[:ties] += 1
    prompt "It's a tie!"
  end
  total[:games] += 1

  output_totals(total)

  if total[:score_usr] == FINAL_WIN_NUM || total[:score_com] == FINAL_WIN_NUM
    display_final_winner(total)
    total = reset_total_result
  end

  prompt('Play again? (y or n)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"