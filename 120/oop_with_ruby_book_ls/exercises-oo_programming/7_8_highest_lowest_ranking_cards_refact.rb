# Update this class so you can use it to determine the lowest ranking and highest ranking cards in an Array of Card objects:
require 'pry'

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


# For this exercise, numeric cards are low cards, ordered from 2 through 10. Jacks are higher than 10s, Queens are higher than Jacks, Kings are higher than Queens, and Aces are higher than Kings. The suit plays no part in the relative ranking of cards.
#
#     If you have two or more cards of the same rank in your list, your min and max methods should return one of the matching cards; it doesn't matter which one.
#
# Besides any methods needed to determine the lowest and highest cards, create a #to_s method that returns a String representation of the card, e.g., "Jack of Diamonds", "4 of Clubs", etc.
#
# Examples:

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
# Output:


# 2 of Hearts
# 10 of Diamonds
# Ace of Clubs
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
