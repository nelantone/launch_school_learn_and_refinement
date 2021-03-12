require 'pry-byebug'

=begin
PEDAC
- Problem understanding:
  - mental model:
    - Create a Twenty-One game: with some card values get as close to 21 as
    possible,without going over. If you go over 21, it's a "bust" and you lose.
  - input: get strings
  - output: 'winner is...'
  - rules:
    - 52-card deck consisting of the 4 suits (hearts, diamonds,
    clubs, and spades), and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack,
    queen, king, ace).
    - Setup: the game consists of a "dealer" and a "player".
    Both participants are initially dealt 2 cards.
    The player can see their 2 cards, but can only see one of the dealer's cards
    - Card	Value
      2 - 10	face value
      jack, queen, king	10
      ace	1 or 11
    - Player turn: the player goes first, and can decide to either "hit"
    or "stay". A hit means the player will ask for another card.
    Remember that if the total exceeds 21, then the player "busts" and loses.
    - when the player stays, it's the dealer's turn. The dealer must follow
    a strict rule for determining whether to hit or stay: hit until the total
    is at least 17. If the dealer busts, then the player wins.
    - Comparing cards: when both the player and the dealer stay, it's time to
    compare the total value of the cards and see who has the highest value.
  - Examples:
   - dealer is showing a "10" (the other card is hidden), and the player has
   a "2" and a "4", then the obvious choice is for the player to "hit"
   tbc
  - Data structure:
    CARDS(hash if 52 cards)
  - Algorithm:
    - from 52 card have 2 random cards from:
      - user
      - computer
    - first one random card of computer/you is shown.
    - 1st you decide to 'stay'(next move from the other player)
    or 'hit'(ask for another card)[repeat until 'bust or 'stay']
    if player 'bust' computer win
    - then computer(dealer) decide to hit/stay.
    - when dealer stays to both show cards to see who won.
    - if somebody have bigger number than 21 loses the game.
    if dealer busts player win game
    - if both stay the closest player to 21 win the game.
  - Code
=end

# (hearts, diamonds, clubs, and spades): :h, :d, c:, s:
# heart cards
suits = [:h, :d, :c, :s]
special_c = [:j, :k, :q, :a]
cards = {}
suits.each do |suit|
  2.upto(10) { |num| cards["#{suit}_#{num}".to_sym] = num }
  special_c.each do |elem|
    cards["#{suit}_#{elem}".to_sym] = if elem == :a
                                        [1, 11]
                                      else
                                        10
                                      end
  end
end

DECK = cards
PLAY = { player: 'Player', dealer: 'Dealer' }
OPTIONS = { '1' => 'Hit', '2' => 'Stay' }
player_cards = []
dealer_cards = []
current_gambler = 'Dealer'
turn = 0
total_cards = [player_cards, dealer_cards]

def prompt(msg)
  puts "=> #{msg}"
end

def stop_and_continue
  puts "press enter to continue"
  gets.chomp
end

def start_game
  puts
  puts "=*" * 8
  puts "Welcome to 21".upcase.center(15)
  puts "=*" * 8
  puts
  stop_and_continue
end

def turn(gambler)
  if gambler == 'Player'
    PLAY[:dealer]
  else
    PLAY[:player]
  end
end

def as_card_present?(cards)
  cards.any? { |card| card.end_with?('a') }
end

def as_cards_front(cards)
  cards.select { |card| card.end_with? 'a' }
end

def cards_without_as(cards)
  cards.select { |card| !(card.end_with? 'a') }
end

def as_cards_values(cards)
  if as_card_present?(cards)
    as_card_values = []

    as_cards_front(cards).each do |as_card|
      no_as_card_values = cards_without_as_values(cards)

      as_card_values << if (as_card_values + no_as_card_values).sum <= 10
                          DECK[as_card][1]
                        else
                          DECK[as_card][0]
                        end
    end
    as_card_values
  else
    0
  end
end

def card_vals(cards)
  no_as_card_vals = cards_without_as(cards).map { |card| DECK[card] }
  as_card_vals = as_cards_values(cards)

  as_card_present?(cards) ? (no_as_card_vals + as_card_vals) : no_as_card_vals
end

def cards_without_as_values(cards)
  no_ases_cards = cards_without_as(cards)
  card_vals(no_ases_cards)
end

def get_first_each_two(player_cards, dealer_cards)
  player_cards.concat([DECK.keys.sample, DECK.keys.sample])
  dealer_cards.concat([DECK.keys.sample, DECK.keys.sample])
end

# rubocop:disable Metrics/AbcSize
def full_game_display(player_cards, dealer_cards, gambler)
  player_card_vals = card_vals(player_cards)
  player_show_card = player_card_vals.first
  dealer_show_card = card_vals(dealer_cards).first
  cards_player_val_no_last = player_card_vals[1, player_card_vals.size]

  prompt "Right now turn is: #{gambler.upcase}"
  puts
  puts '-- CARDS --'
  prompt "Dealer show: #{dealer_cards.last} [#{dealer_show_card}]"
  prompt "Player show: #{player_cards.last} [#{player_show_card}]"
  puts
  puts '=' * 10
  prompt "your hidden cards: #{player_cards[0]} #{cards_player_val_no_last}"
  puts '=' * 10
end
# rubocop:enable Metrics/AbcSize

def display_player_total(cards)
  puts
  puts '-' * 10
  prompt "Your total so far: #{card_vals(cards).sum}"
  puts '-' * 10
end

def player_decision(gambler)
  if gambler == 'Player'
    loop do
      puts
      prompt "What do you want to do?"
      puts
      puts "Type and press enter:"
      OPTIONS.each do |key, val|
        puts "'#{key}' for #{val}"
      end
      selection = gets.chomp
      break if OPTIONS.keys.include?(selection)
    end
  end
  system 'clear'
end

def busted(player_cards, dealer_cards)
  if card_vals(player_cards).sum > 21
    puts "#{PLAY[:player]} 'bust' #{PLAY[:dealer]}(computer) win!"
  elsif card_vals(dealer_cards).sum > 21
    puts "#{PLAY[:dealer]}(computer) 'bust' #{PLAY[:player]} win!"
  end
end

def someone_busted?(player_cards, dealer_cards)
  !!busted(player_cards, dealer_cards)
end

def choose_winner(total_cards)
  result_player = card_vals(total_cards[0]).sum
  result_dealer = card_vals(total_cards[1]).sum

  if result_player >= result_dealer && result_player < 21
    PLAY[:player]
  elsif result_dealer >= result_player && result_dealer < 21
    PLAY[:dealer]
  else
    "It's a tie! There is no winner"
  end
end

def display_winner(total_cards)
  winner = choose_winner(total_cards)
  puts '=' * 10
  prompt "the winner is #{winner}!".upcase
  puts '=' * 10
  puts
end

def display_final_result(total_cards)
  puts "=" * 10
  puts "Result of the game".upcase
  puts "-" * 10
  puts

  total_cards.each_with_index do |cards, idx|
    puts "--- #{PLAY.values[idx].upcase} ---"
    prompt "Cards: #{cards}"
    prompt "Result: #{card_vals(cards).sum}"
    puts
  end
end

def end_game
  prompt "Bye, thanks for playing Twenty one!"
end

start_game
get_first_each_two(player_cards, dealer_cards)

loop do
  current_gambler = turn(current_gambler)
  full_game_display(player_cards, dealer_cards, current_gambler)
  display_player_total(player_cards)
  break if someone_busted?(player_cards, dealer_cards)
  player_decision(current_gambler)
  turn += 1
  break if turn == 2
end

display_final_result(total_cards)
display_winner(total_cards)
end_game
