require_relative 'gamer'

class Bank
  
  BET = 10

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def make_a_bets(player, dealer)
    player.make_a_bet(BET)
    dealer.make_a_bet(BET)
    @balance += BET * 2
  end

  def win(player)
    player.get_money(@balance)
    clean_balance!
  end

  def draw(player, dealer)
    player.get_money(BET)
    dealer.get_money(BET)
    clean_balance!
  end

  #private

  def clean_balance!
    @balance = 0
  end
end
