# frozen_string_literal: true

require_relative 'card'
require_relative 'deck'
require_relative 'bank'
require_relative 'gamer'
require_relative 'player'
require_relative 'dealer'

class Game
  attr_reader :player, :dealer, :bank, :deck

  def initialize(user_name)
    @player = Player.new(user_name)
    @dealer = Dealer.new
    @bank = Bank.new
    start_game
  end

  def start_game
    @deck = Deck.new
    bank.make_a_bets(player, dealer)
    player.cards = []
    dealer.cards = []
    2.times { get_cards(player) }
    2.times { get_cards(dealer) }
  end

  def get_cards(gamer)
    gamer.cards << deck.cards.shift
  end

  def show_card(gamer)
    gamer.cards.each { |card| yield(card) }
  end

  def add_card?
    dealer.scoring < 17
  end

  def dealer_add_card
    get_cards(dealer) if add_card?
  end

  def two_card?(gamer)
    gamer.cards.size == 2
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def who_win
    return nil if player.scoring == dealer.scoring
    return false if player.scoring > 21 && dealer.scoring > 21 # !
    return @player if dealer.scoring > 21 && player.scoring <= 21
    return @dealer if player.scoring > 21 && dealer.scoring <= 21

    return @dealer if dealer.scoring > player.scoring && dealer.scoring + player.scoring <= 41
    return @player if dealer.scoring < player.scoring && dealer.scoring + player.scoring <= 41
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def whose_money
    whose = who_win
    if whose
      bank.win(whose)
    elsif nil
      bank.draw(player, dealer)
    else
      bank.clean_balance!
    end
  end
end
