INIT_M = ' '
PLYR_MK = 'X'
COMP_MK = 'O'
WIN_RESULTS = [%w(00 01 02), %w(10 11 12), %w(20 21 22), %w(00 11 22),
               %w(02 11 20), %w(00 10 20), %w(01 11 21), %w(02 12 22)]

# rubocop:disable Metrics/AbcSize
def display_matrix(m)
  puts ''
  puts "#{m[0][0]} | #{m[0][1]} | #{m[0][2]}".center(28)
  puts ' ' * 7 + '- ' * 7 + ' ' * 7
  puts "#{m[1][0]} | #{m[1][1]} | #{m[1][2]}".center(28)
  puts ' ' * 7 + '- ' * 7 + ' ' * 7
  puts "#{m[2][0]} | #{m[2][1]} | #{m[2][2]}".center(28)
  puts ''
end
# rubocop:enable Metrics/AbcSize

def free_spots(matrix)
  free_not_filtered_spots = matrix.map.with_index do |row_spot, idx_r|
    row_spot.map.with_index do |_, idx_c|
      [idx_r, idx_c] if matrix[idx_r][idx_c] == INIT_M
    end
  end
  free_not_filtered_spots.map { |row| row.delete_if(&:nil?) }
end

def display_spots(matrix)
  free_spots(matrix).map { |row| p row.map(&:join) }
end

def show_opt_and_free_spots(m)
  puts "Please choose one free spot, it will be market with an 'X'"
  puts "your free spots are:"
  puts ''
  display_spots(m)
  puts ''
  puts "You are 'X', computer is 'O'"
  puts ''
  puts 'choose a row and column/item'
  puts 'For example top left is 00, bottom right 22, center 11'
end

def play(player_row_col, mark, m)
  row_player = player_row_col[0].to_i
  col_player = player_row_col[1].to_i
  m[row_player][col_player] = mark
end

def player_won?(matrix, mark, m)
  if WIN_RESULTS.map { |win_res| win_res.all? { |el| matrix.include? el } }.any?
    display_matrix(m)
    mark == COMP_MK ? (puts 'Computer won!') : (puts 'Player won!')
    true
  end
end

def show_player_results(matrix, mark)
  total = []
  matrix.each_with_index do |row, idx_r|
    row.each_with_index do |elem, idx_c|
      total << "#{idx_r}#{idx_c}" if elem == mark
    end
  end
  total
end

def a_tie?(free_spots, m)
  if free_spots.all?(&:empty?)
    display_matrix(m)
    puts "there is no winner, it's a tie!"
    true
  end
end

def spot_validator(free_spots, row_col_usr, m)
  until free_spots.include?(row_col_usr)
    puts ''
    puts 'Error:'
    puts "#{row_col_usr} not valid, please check again the valid options:"
    puts ''
    display_spots(m)
    puts 'choose a row and column/item'
    row_col_usr = gets.chomp
  end
end

def user_game(single_ary_free_spots, m)
  show_opt_and_free_spots(m)
  row_col_usr = gets.chomp

  spot_validator(single_ary_free_spots, row_col_usr, m)
  play(row_col_usr, PLYR_MK, m)
  show_player_results(m, PLYR_MK)
end

def update_free_spots(m)
  free_spots(m).flatten(1).map(&:join)
end

def computer_game(row_col_computer, m)
  play(row_col_computer, COMP_MK, m)
  show_player_results(m, COMP_MK)
end

puts 'Welcome to Tic Tac Toe!'.center(28)

loop do
  system 'clear'
  m = [
    [INIT_M, INIT_M, INIT_M],
    [INIT_M, INIT_M, INIT_M],
    [INIT_M, INIT_M, INIT_M]
  ]

  loop do
    single_ary_free_spots = free_spots(m).flatten(1).map(&:join)

    break if a_tie?(single_ary_free_spots, m)

    display_matrix(m)

    user_results = user_game(single_ary_free_spots, m)

    break if player_won?(user_results, PLYR_MK, m)

    row_col_computer = update_free_spots(m).sample

    break if a_tie?(update_free_spots(m), m)

    computer_results = computer_game(row_col_computer, m)

    break if player_won?(computer_results, COMP_MK, m)
  end

  puts "to you want to play again? 'Yes/y' 'no' or other key to finish game"
  play_again = gets.chomp
  unless play_again.downcase == 'y' || play_again.downcase == 'yes'
    puts "Thank you for playing Tic Tac Toe, hope to see you soon!"
    break
  end
end
