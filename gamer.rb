require_relative 'card'
require_relative 'deck'
require_relative 'bank'

class Gamer

  attr_reader :balance, :cards, :name
  attr_writer :cards

  START_MONEY = 100
  
  def initialize
    @balance = START_MONEY
    @cards = []
  end

  def make_a_bet(bet)
    @balance -= bet
  end

  def get_money(money)
    @balance += money
  end

  def scoring
    score = 0
    cards.each do |card|
      score += card.value
      if score > 21 && card.name == 'A'
        score -= 10
      end
    end
    score
  end
end
