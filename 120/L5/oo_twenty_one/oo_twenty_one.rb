require 'pry'

module Hand
  def normal_cards_in_num(current_cards)
    filtered_cards = []
    current_cards.each do |card|
      if card.face.to_i != 0
        filtered_cards << card.face.to_i
      elsif card.face.to_i == 0 && card.face != 'Ace'
        filtered_cards << 10
      else
        next
      end
    end
    filtered_cards
  end

  def transform_ace_in_num(current_cards)
    filtered_cards = []
    current_cards.each do |card|
      if card.face == 'Ace'
        if (filtered_cards.sum + 1) < 21
          max_result = (21- filtered_cards.sum)
          filtered_cards << (max_result < 11 ? max_result : 11)
        else
          filtered_cards << 1
        end
      end
    end
    filtered_cards
  end

  def cards_in_nums
    normal_cards_in_num(@current_cards) + transform_ace_in_num(@current_cards)
  end
end

class Player
  include Hand
  attr_accessor :name, :cards, :current_cards

  def initialize(name, cards)
    @name = name
    @current_cards = [cards.pop, cards.pop]
    @cards = cards
    @stay = false
  end

  def stayed?
    @stay
  end

  def stay
    @stay = true
    p "#{@name} stayed"
  end

  def busted?
    cards_in_nums.sum > 21
  end

  def hit
    @current_cards << @cards.pop
  end
end

class Card
  SUITS = ['H', 'D', 'S', 'C']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{face} of #{suit}"
  end

  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @face
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'S' then 'Spades'
    when 'C' then 'Clubs'
    end
  end

  def ace?
    face == 'Ace'
  end

  def king?
    face == 'King'
  end

  def queen?
    face == 'Queen'
  end

  def jack?
    face == 'Jack'
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end

    scramble!
  end

  def scramble!
    cards.shuffle!
  end
end

class Game
  attr_accessor :player, :computer

  def initialize
    @player = player
    @computer = computer
    @deal_cards = Deck.new.cards
  end

  def choose_name_with_two_cards
    name = ''
    puts 'Please choose a player name'
    name = gets.chomp
    puts "Your player name is #{name}"
    @player = Player.new(name, @deal_cards)
  end

  def computer_name_with_two_cards
    name = ['Miyagui', 'AI-GTDP', 'Lotus', 'Fanzero'].sample
    puts "Computer name is #{name}"
    @computer = Player.new(name, @deal_cards)
  end

  def show_player_cards
    puts @player.current_cards
  end

  def show_computer_cards
    puts @computer.current_cards
  end

  def all_stay?
    @player.stayed? && @computer.stayed?
  end

  def someone_got_busted?
    @player.busted? || @computer.busted?
  end

  def end_round?
    someone_got_busted? || all_stay?
  end

  def player_turn
    puts 'these are you current cards, what o you want to do?'
    show_player_cards
    choice = ''
    loop do
      puts "please choose one of the options: stay(s), hit(h),"
      choice = gets.chomp.downcase
      break if %w[s h].include? choice
    end
    if choice == 's'
      @player.stay
    elsif choice == 'h'
      @player.hit
    end
  end

  def computer_turn
    @computer.cards_in_nums.sum >= 16 ? @computer.stay : @computer.hit
  end

  def new_game?
    play = ''
    loop do
      p 'Do you want to play again? y/n'
      play = gets.chomp.downcase
      break if %w[y n].include? play
    end
    if play == 'y'
      @deal_cards = Deck.new.cards
      @player.current_cards   = [@deal_cards.pop, @deal_cards.pop]
      @computer.current_cards = [@deal_cards.pop, @deal_cards.pop]
      true
    else
      end_game
      false
    end
  end

  def start
    choose_name_with_two_cards
    computer_name_with_two_cards
    loop do
      loop do
        player_turn
        break if end_round?
        computer_turn
        break if end_round?
      end
      show_result
      break unless new_game?
    end
  end

  def show_result
    puts "-" * 10
    puts "the final result is:"
    player_result
    computer_result
    puts "-" * 10
    display_winner
    puts "-" * 10
  end

  protected

  def tie
    puts "it's a tie between computer '#{@computer.name}' and you '#{@player.name}'".upcase
  end

  def computer_won
    puts "computer #{@computer.name} won!".upcase
  end

  def player_won
    puts "you won #{@player.name}!".upcase
  end

  def player_result
    puts "-" * 10
    puts "For Player:  #{@player.name}"
    puts show_player_cards
    puts "#{@player.cards_in_nums.sum} points in total"
    puts ''
  end

  def computer_result
    puts "-" * 10
    puts "For Computer:  #{@computer.name}"
    puts show_computer_cards
    puts "#{@computer.cards_in_nums.sum} points in total"
    puts ''
  end

  def winner_not_busted
    if @player.cards_in_nums.sum > @computer.cards_in_nums.sum
      player_won
    elsif @computer.cards_in_nums.sum > @player.cards_in_nums.sum
      computer_won
    else
      tie
    end
  end

  def display_winner
    return puts "computer got busted! #{player_won}".upcase if @computer.busted?
    return puts "you got busted! #{computer_won}".upcase if @player.busted?
    winner_not_busted
  end

  def end_game
    p 'Thanks for playing!'
  end
end

Game.new.start

# possible next steps
# Refactor methods to specific classes that fits better teh function