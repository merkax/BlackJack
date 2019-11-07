require_relative 'gamer'

class Dealer < Gamer

  def initialize
    super('Dealer')
  end

  def skip
 # Пропустить ход (если очков у дилера 17 или более). Ход переходит игроку. 

  end

  def get_cards
 # Добавить карту (если очков менее 17).
  end


end
