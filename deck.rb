# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    create_deck
    random_card
  end

  private

  def create_deck
    Card::SUITS.each do |_card, suit|
      Card::VALUES.each do |name, value|
        @cards << Card.new(suit, name, value)
      end
    end
 end

  def random_card
    @cards.shuffle!
  end
end
