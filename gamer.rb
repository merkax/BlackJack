require_relative 'card'
require_relative 'deck'
require_relative 'bank'


class Gamer

  attr_reader :balance, :cards, :name

  START_MONEY = 100
  
  def initialize#(name)
    # @name = name
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
    score # сумма очков в руке у игрока
  end

  # def get_cards(deck)
  #   cards << deck.cards.shift # получить первую карту из колоды
  # end
end



  
  # def card_values(name)
  #   VALUES[name]
  # end

  # def get_cards(deck)
  #   cards << deck.cards.shift # получить первую карту из колоды
  # end

#  end

