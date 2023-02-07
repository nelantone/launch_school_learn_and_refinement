# Deck of Cards
# Using the Card \class from the previous exercise, create a Deck \class that contains all of the standard 52 playing
# cards. Use the following code to start your work:
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

  def min
    ary = self
    result = 0
    result_candidate = 0
    current_filtered_result = 0

    ary.each_with_index do |card, idx|
      if idx == 0
        result = card
      else
        result_candidate        = transform_special_cards_to_num(card.rank)
        current_filtered_result = transform_special_cards_to_num(result.rank)
      end

      (result_candidate <=> current_filtered_result) == -1 ? result = card : next
    end
    result
  end

  def max
    ary = self
    result = 0
    result_candidate = 0
    current_filtered_result = 0

    ary.each_with_index do |card, idx|
      if idx == 0
        result = card
      else
        result_candidate        = transform_special_cards_to_num(card.rank)
        current_filtered_result = transform_special_cards_to_num(result.rank)
      end

      (result_candidate <=> current_filtered_result) == 1 ? result = card : next
    end
    result
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
# The Deck \class should provide a #\draw method to deal one card. The Deck should be shuffled when it is initialized
# and, \if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.

# Examples:

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
pp drawn.count { |card| card.rank == 5 } == 4
pp drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }

pp drawn != drawn2 # Almost always.
# Note that the last line should almost always be true; \if you shuffle the deck 1000 times a second, you will be very,
# very, very old before you see two consecutive shuffles produce the same results. If you get a false result, you almost certainly have something wrong.