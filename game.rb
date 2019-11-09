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

  def show_balance(player, dealer)
    puts "#{player.name}: #{player.balance}$ | Dealer: #{dealer.balance}$"
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

   def who_win(player, dealer)
     return bank.draw(player,dealer) if player.scoring == dealer.scoring
     return bank.clean_balance! if player.scoring > 21 && dealer.scoring > 21
     return bank.win(player) if dealer.scoring > 21 && player.scoring <= 21
     return bank.win(dealer) if player.scoring > 21 && dealer.scoring <= 21

     return bank.win(dealer) if dealer.scoring > player.scoring && dealer.scoring + player.scoring <= 41
     return bank.win(player) if dealer.scoring < player.scoring && dealer.scoring + player.scoring <= 41
   end
end
