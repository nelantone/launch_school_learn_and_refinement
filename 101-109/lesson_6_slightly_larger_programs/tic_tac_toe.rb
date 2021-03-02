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

def display_matrix(m)
  puts ''
  puts "#{m[0][0]} | #{m[0][1]} | #{m[0][2]}".center(28)
  puts ' '*7 + '- '*7 + ' '*7
  puts "#{m[1][0]} | #{m[1][1]} | #{m[1][2]}".center(28)
  puts ' '*7 + '- '*7 + ' '*7
  puts "#{m[2][0]} | #{m[2][1]} | #{m[2][2]}".center(28)
  puts ''
end

def free_spots(matrix)
  matrix.map.with_index do |row_spot, idx_r|
    row_spot.map.with_index do |col_spot, idx_c|
      [idx_r,idx_c] if matrix[idx_r][idx_c] == ' '
    end
  end.map {|row| row.delete_if(&:nil?)}
end

def display_spots(matrix)
  free_spots(matrix).map {|row| p row.map {|item| item.join }}
end

def play(player_row_col, symbol, m)
  row_player = player_row_col[0].to_i
  col_player = player_row_col[1].to_i

  m[row_player][col_player] = symbol
end

puts 'Welcome to Tic Tac Toe!'.center(28)

m = [
      [' ',' ',' '],
      [' ',' ',' '],
      [' ',' ',' ']
    ]

loop do
  single_ary_free_spots = free_spots(m).flatten(1).map(&:join)

  display_matrix(m)

  puts 'Please mark a square on the game'
  puts "your free spots are:"
  puts ''

  display_spots(m)

  puts ''
  puts 'For example top left is 00, bottom right 22, center 11'
  puts 'choose a row and column/item'
  row_col_usr = gets.chomp

  single_ary_free_spots.include?(row_col_usr)

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

  row_col_computer = single_ary_free_spots.sample
  play(row_col_computer, 'O', m)
end

