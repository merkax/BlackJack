require_relative 'card'
require_relative 'deck'

class Gamer

  attr_reader :balance, :name, :cards

  def initialize(name)
    @name = name
    @balance = 100
    @cards = []
  end

  
  def skip
 
  end

  def get_cards(deck)
    cards << deck.cards.shift # получить первую карту из колоды
  end





end

