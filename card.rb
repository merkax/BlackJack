# frozen_string_literal: true

require_relative 'card'

class Card
  SUITS = {
    spade: '♠',
    heart: '♥',
    diamond: '♦',
    club: '♣'
  }.freeze

  VALUES = {
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6,
    7 => 7,
    8 => 8,
    9 => 9,
    10 => 10,
    'J' => 10,
    'Q' => 10,
    'K' => 10,
    'A' => 11
  }.freeze

  attr_reader :suit, :name, :value

  def initialize(suit, name, value)
    @suit = suit
    @name = name
    @value = value
  end

  def ace?
    name == 'A'
  end
end
