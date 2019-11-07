require_relative 'gamer'

class Player < Gamer

  attr_reader :name


  def initialize(name)
    @name = name
    super()
  end

  def open_cards

  end

  
end
