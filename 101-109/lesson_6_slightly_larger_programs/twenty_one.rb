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

def prompt(msg)
  puts "=> #{msg}"
end

def intro
  puts "Welcome to 21"
  puts "prese enter to start"
  gets.chomp
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

      as_card_values << if (as_card_values + no_as_card_values).sum < 10
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
  card_vals(no_ases_cards) # refactor
end

def your_cards
  [:d_a, :h_a] # << DECK.keys.sample ##debug]
end

def show_your_cards(cards)
  all_cards = card_vals(cards)
  las_card_val = all_cards.last # refactor
  cards_vals_whitout_last = all_cards[0, all_cards.size - 1] # refactor

  prompt "your shown card: #{cards.last} [#{las_card_val}]"
  puts '=' * 10
  prompt "your hidden card/s: #{cards[0]} #{cards_vals_whitout_last}"
end

# def dealer_cards
# end

def display_your_total(cards)
  prompt "Your cards: #{cards.join(', ')} "
  prompt "Your card values: #{card_vals(cards).join(', ')}"
  prompt "Your total so far: #{card_vals(cards).sum}"
end

# start game
intro
cards = your_cards
show_your_cards(cards)
puts
puts '-' * 10
display_your_total(cards)
puts '-' * 10
