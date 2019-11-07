class Card

  SUITS = {
    spade: "♠",
    heart: "♥",
    diamond: "♦",
    club: "♣"
  }

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
  }

  # attr_reader 

  def initialize(suit, name, value)
    @suit = suit
    @name = name
    @value = value
  end
  


end
