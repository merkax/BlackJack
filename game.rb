require_relative 'card'
require_relative 'deck'
require_relative 'bank'
require_relative 'gamer'
require_relative 'player' 
require_relative 'dealer'

class Game

  attr_reader :player, :dealer, :bank, :deck#, :cards

  def initialize(user_name)
    @player = Player.new(user_name)
    @dealer = Dealer.new
    @bank = Bank.new
    start_game
  end

  def start_game
    @deck = Deck.new
    bank.make_a_bets(player, dealer)
    # 2.times { player.get_cards(deck) }
    # 2.times { dealer.get_cards(deck) }
    2.times { get_cards(player) }
    2.times { get_cards(dealer) }
  end

  def get_cards(gamer)
    gamer.cards << deck.cards.shift # получить первую карту из колоды
  end
end
