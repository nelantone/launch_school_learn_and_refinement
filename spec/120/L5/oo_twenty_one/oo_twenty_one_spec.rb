require 'spec_helper'
require './120/L5/oo_twenty_one/oo_twenty_one'



RSpec.describe Deck, '#scramble' do
  # before do
  #   expect_any_instance_of(Game).to receive(:gets).and_return('tss')
  #   Object.stub!(:gets) { 'tss' }
  #   allow(Game).to receive(:gets).and_return('tssss')
  #   allow(Object).to receive(:gets).and_return('tsss')
  # end
  # # https://stackoverflow.com/questions/53527160/testing-gets-in-rspec-user-input
  # # https://www.oneworldcoders.com/apprentice-journals/dependencynbsp-injection-in-testing
  let(:game)                   { Game.new }
  let(:start_new_game)         { game.start }
  let(:deck)                   { Deck.new }
  let(:cards)                  { deck.cards }
  let(:player)                 { Player.new('Ton', cards) }
  let(:computer)               { Player.new('Mijagi', cards) }
  let(:player_initial_cards)   { player.current_cards }
  let(:computer_initial_cards) { computer.current_cards }

  context 'When I start a new game' do
    it 'return all initial cards' do
      deck.scramble!
      expect(cards.count).to eql(52)
    end
  end

  context 'player and computer dealt initially with two cards each' do
    it 'return 2 player cards and pop 2 cards from the deck' do
      expect(player_initial_cards.count).to eql(2)
      expect(computer_initial_cards.count).to eql(2)
      expect(cards.count).to eql(48)
    end
  end

  context 'The player and computer play one turn and both stay and show the final result' do
    it 'stays and waits for computer' do
      start_new_game
      player.stay
      computer.stay
      expect(player.stay).to eql("Ton stayed")
      expect(computer.stay).to eql("Mijagi stayed")
      show_total = game.show_result
      expect(player_initial_cards.count).to eql(2)
      expect(computer_initial_cards.count).to eql(2)
      expect(cards.count).to eql(48)
      expect(show_total).to eql('Thanks for playing!')
    end
  end

  context 'The computer and player takes the next turn and both hit' do
    it 'Player an Computer hits and take a new card' do
      player.hit
      computer.hit
      player.current_cards.count.eql?(3)
      computer.current_cards.count.eql?(3)
      cards.count.equal?(46)
    end
  end

  context 'Someone got busted' do
    it 'Computer got busted' do
      computer.current_cards = [Card.new(suit="D", @face="A"), Card.new(suit="D", @face="J"), Card.new(suit="D", @face="10"),  Card.new(suit="D", @face="8")]
      expect(computer.busted?).to be true
    end

    it 'Player got busted' do
      player.current_cards = [Card.new(suit="D", @face="K"), Card.new(suit="D", @face="J"), Card.new(suit="D", @face="10")]
      expect(player.busted?).to be true
    end
  end

  context 'start and end a full game with a winner' do
    # it 'game starts and player chose name have some cards' do
    #   pp @player = Player.new('tst', cards)
    #   pp @computer = Player.new('me', cards)
    # end
  end
end
