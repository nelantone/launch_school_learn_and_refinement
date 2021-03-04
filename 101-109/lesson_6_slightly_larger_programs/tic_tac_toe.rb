require 'pry-byebug'
=begin
tictactoe for one player
-Problem understanding
 the program is a tic tact toe game player vs computer
 2 options X or O.
 then we have a matrix.
 0 - display the board
 1 - first (random) player start and choose one coordenate of the 3x3 matrix
 2 - second player continues(1 turn each)
  * repeat until... winner or tie
 3 - when there are 3 of the same 'x' or 'O' in diagonal or horizonal.
  we have a winer.
- input: coordenate numbers until win/or is a tie from player  1 or 2
- output: exit the game
- rules:
  - 3x3 matrix
  - intercal player turns
  - winner on line horizontal, vertical or diagonal (3 numbers with same val)
  - tie, no mor posibilities to win(all winer combinations are no possible)
- winner coordenates:
  - (0,0),(0,1),(0,2)
  - (0,0),(1,0),(2,0)
  and so on...
  4 - if all the 9 posibilites are marked and no winner then is a tie.
  5 - ask if you wan to play again or go (repeat until user want to go)
- Examples:

- Data structure

- Agorithm:
- welcome and display matrix
- random start (computer or person)? first start person.
- show selection in the board.

- Code
=end

WIN_RESULTS = [ %w(00 01 02), %w(10 11 12), %w(20 21 22), %w(00 11 22),
                  %w(02 11 20), %w(00 10 20), %w(01 11 21), %w(02 12 22) ]

def display_matrix(m)
  puts ''
  puts "#{m[0][0]} | #{m[0][1]} | #{m[0][2]}".center(28)
  puts ' ' * 7 + '- ' * 7 + ' ' * 7
  puts "#{m[1][0]} | #{m[1][1]} | #{m[1][2]}".center(28)
  puts ' ' * 7 + '- ' * 7 + ' ' * 7
  puts "#{m[2][0]} | #{m[2][1]} | #{m[2][2]}".center(28)
  puts ''
end

def free_spots(matrix)
  matrix.map.with_index do |row_spot, idx_r|
    row_spot.map.with_index do |_, idx_c|
      [idx_r, idx_c] if matrix[idx_r][idx_c] == ' '
    end
  end.map { |row| row.delete_if(&:nil?) }
end

def display_spots(matrix)
  free_spots(matrix).map { |row| p row.map(&:join) }
end

def play(player_row_col, symbol, m)
  row_player = player_row_col[0].to_i
  col_player = player_row_col[1].to_i

  m[row_player][col_player] = symbol
end

def player_won?(matrix)
  WIN_RESULTS.map {|win_res| win_res.all? { |el| matrix.include? el } }.any?
end

def show_player_results(matrix, symbol)
  total = []
  matrix.each_with_index do |row, idx_r|
    row.each_with_index do |elem, idx_c|
      total << "#{idx_r}#{idx_c}" if elem == symbol
    end
  end
  total
end

puts 'Welcome to Tic Tac Toe!'.center(28)
loop do
  m = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
  ]

  loop do
    single_ary_free_spots = free_spots(m).flatten(1).map(&:join)

    if single_ary_free_spots.all?(&:empty?)
      puts "there is no winner, it's a tie!"
      break
    end

    display_matrix(m)

    puts "Please choos one free spot, it will be market with an 'X'"
    puts "your free spots are:"
    puts ''
    display_spots(m)
    puts ''
    puts "You are 'X', computer is 'O'"
    puts ''
    puts 'choose a row and column/item'
    puts 'For example top left is 00, bottom right 22, center 11'


    row_col_usr = gets.chomp

    until single_ary_free_spots.include?(row_col_usr)
      puts ''
      puts 'Error:'
      puts "#{row_col_usr} not valid, please check again the valid options:"
      puts ''
      display_spots(m)
      puts 'choose a row and column/item'
      row_col_usr = gets.chomp
    end

    play(row_col_usr, 'X', m)

    player_results = show_player_results(m, 'X')

    if player_won?(player_results)
      display_matrix(m)
      puts 'Player won!'
      break
    end

    row_col_computer = single_ary_free_spots.sample
    play(row_col_computer, 'O', m)

    computer_results = show_player_results(m, 'O')

    if player_won?(computer_results)
      display_matrix(m)
      puts 'Computer won!'
      break
    end
  end
  puts "to you want to play again? 'Yes/y' 'no' or other key to finish game"
  play_again = gets.chomp
  unless play_again.downcase == 'y' || play_again.downcase == 'yes'
    puts "Thank you for playing Tic Tac Toe, hope to see you soon!"
    break
  end
end


=begin
  Problem understanding:
  - mental model:
    from tictactoe nested array, return true if the player 'X' or 'O' as won
    * use one method for both but test separetely
    * we have the win results collection WIN_RESULTS(above)

  Examples (below)

  D
  Algorithm:
    - iterate each row
    from each row compare each of the win results, see if all are present
    * maybe with `any?` for true
  C
=end

# def player_won?(matrix)
#   WIN_RESULTS.map {|win_res| win_res.all? { |el| matrix.include? el } }.any?
# end

# m_no_win_x = ["00", "02", "12", "21"]
# m_no_win_o = ["01", "10", "11", "20", "22"]

# player_won?(m_no_win_x) == false
# player_won?(m_no_win_o) == false

# m_x_won = ["00", "11", "22"]
# player_won?(m_x_won) == true

# m_x_won = ["00", "02", "11", "22"]

# player_won?(m_x_won) == true

# m_o_won = ["00", "01", "02", "22"]

# player_won?(m_o_won)  ==  true

# is_a_winner = ["01", "02", "10", "12", "22"]

# player_won?(is_a_winner)  ==  true


# def player_won?(matrix)
#   WIN_RESULTS.map do |win_res|
#     p win_res
#     win_res.all? do |el|
#       p el
#       p matrix.include? el
#     end
#   end.any?
# end