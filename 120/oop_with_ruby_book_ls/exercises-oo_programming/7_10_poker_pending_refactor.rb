# Poker!
# In the previous two exercises, you developed a Card class and a Deck class. You are now going to use those classes to create and evaluate poker hands. Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards as a Poker hand. If you've never played poker before, you may find this overview of poker hands useful.
#
# You should build your class using the following code skeleton:
#
# # Include Card and Deck classes from the last two exercises.

require 'pry'

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def shuffle
    all_cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        all_cards << Card.new(rank, suit)
      end
    end
    all_cards.shuffle
  end

  attr_accessor :draw, :cards

  def initialize
    @ranks = RANKS
    @suits = SUITS
    @cards = shuffle
  end

  def draw
    if @cards == []
      @cards = shuffle
      @cards.pop
    else
      @cards.pop
    end
  end
end

class Array
  def transform_special_cards_to_num(rank_card)
    if rank_card == 'Jack'
      rank_card = 11
    elsif rank_card == 'Queen'
      rank_card = 12
    elsif rank_card == 'King'
      rank_card = 13
    elsif rank_card == 'Ace'
      rank_card = 14
    end
    rank_card
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit
  attr_accessor :cards

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @cards = {}
  end

  def <=>(other_self)
    self.rank <=> other_self.rank
  end

  def card_list
    @cards[rank] = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class PokerHand
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def print
  end

  def evaluate
    if @deck.class == Array
      case
      when royal_flush?     then 'Royal flush'
      when straight_flush?  then 'Straight flush'
      when four_of_a_kind?  then 'Four of a kind'
      when full_house?      then 'Full house'
      when flush?           then 'Flush'
      when straight?        then 'Straight'
      when three_of_a_kind? then 'Three of a kind'
      when two_pair?        then 'Two pair'
      when pair?            then 'Pair'
      else                       'High card'
      end
    end
  end

  private

  def transform_special_cards_to_num(rank_card)
    if rank_card == 'Jack'
      rank_card = 11
    elsif rank_card == 'Queen'
      rank_card = 12
    elsif rank_card == 'King'
      rank_card = 13
    elsif rank_card == 'Ace'
      rank_card = 14
    end
    rank_card
  end

  def royal_flush?
    candidates = []
    deck.each do |card|
      num = transform_special_cards_to_num(card.rank)
      candidates << num if [10, 11, 12, 13, 14].include?(num)
    end
    candidates.sort == [10, 11, 12, 13, 14] && deck.map(&:suit).uniq.size == 1
  end

  def straight_flush?
    straight? && deck.map(&:suit).uniq.size == 1
  end

  def four_of_a_kind?
    deck.map { |card| transform_special_cards_to_num(card.rank) }.tally.values.any?(4)
  end

  def full_house?
    three = deck.map { |card| transform_special_cards_to_num(card.rank) }.tally.values.any?(3)
    two   = deck.map { |card| transform_special_cards_to_num(card.rank) }.tally.values.any?(2)
    three && two
  end

  def flush?
    deck.map { |card| transform_special_cards_to_num(card.suit) }.tally.values.any?(5)
  end

  def straight?
    candidates = []
    deck.each do |card|
      num = transform_special_cards_to_num(card.rank)
      candidates << num
    end
    candidates.sort.map.with_index { |a, i| a - (i)}.uniq.size == 1
  end

  def three_of_a_kind?
    deck.map { |card| transform_special_cards_to_num(card.rank) }.tally.values.any?(3)
  end

  def two_pair?
    deck.map { |card| transform_special_cards_to_num(card.rank) }.tally.values.tally.values.include?(2)
  end

  def pair?
    deck.map { |card| transform_special_cards_to_num(card.rank) }.tally.values.any?(2)
  end
end
# Testing your class:

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'