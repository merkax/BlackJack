# frozen_string_literal: true

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
    cards.each { |card| score += card.value }
    cards.each do |card|
      score -= 10 if score > 21 && card.ace?
    end
    score
   end
end
