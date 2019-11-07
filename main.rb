require_relative 'card'
require_relative 'deck'
require_relative 'gamer'
require_relative 'player'
require_relative 'dealer'
require_relative 'hand'
require_relative 'bank'
require_relative 'game'





class Main


def run
    greeting
    loop do
      show # покажет карты игрока
      start_menu
      user_choice = gets.strip.to_i
      break if user_choice.zero?
      case user_choice
      when 1 then get_card
      when 2 then skips
      when 3 then open_card  
      end
    end
end

private

  attr_reader

  def start_menu
    puts '=' * 30
    puts 'Введите 0, если вы хотите завершить программу'
    puts 'Введите 1, если вы хотите создать станцию'
    puts 'Введите 2, если вы хотите создать поезд'
  end

  def greeting
    puts "Добро пожаловать в игру BlackJack"
    puts "Введите Ваше имя, если хотите продолжить: "
    user_name = gets.strip.capitalize
    player = Player.new(user_name)
    puts "Добрый день #{user_name}"
    puts "На Вашем счету:#{balance}"
  end

  def show(list)
    list.each.with_index(1) { |item, index| puts "#{index}: #{item}" }
  end

end
