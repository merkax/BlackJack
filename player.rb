require_relative 'gamer'

class Player < Gamer

  attr_reader :name


  def initialize(name)
    super(name)
  end

  def open_cards

  end
end
