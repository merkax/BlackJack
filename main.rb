require_relative 'card'
require_relative 'deck'
require_relative 'gamer'
require_relative 'player'
require_relative 'dealer'
require_relative 'bank'
require_relative 'game'

class Main

  def run
    greeting
    loop do
      show_balance
      show_player
      close_card_dealer
      start_menu
      action_options
    end
  end

  private

  attr_reader :game

  def start_menu
    puts
    puts '=' * 30
    puts 'Выберете действие: '
    puts '1 - Взять карту'
    puts '2 - Пропустить ход'
    puts '3 - Открыть карты'
  end

  def greeting
    puts "Добро пожаловать в игру BlackJack"
    puts "Введите Ваше имя, чтобы продолжить: "
    user_name = gets.strip.capitalize
    @game = Game.new(user_name)
  end

  def action_options
    user_choice = gets.strip.to_i
    case user_choice
    when 1 then get_card
    when 2 then skips
    when 3 then show_game
    #when 0 then exit
    end
  end

  def get_card
    game.get_cards(game.player) if game.two_card?(game.player)
    game.dealer_add_card if game.two_card?(game.dealer)
    show_game
  end

  def skips
    game.dealer_add_card
    show_game
  end

  def show_game
    game.who_win
    game.whose_money
    show_balance
    show_player
    show_dealer
    play_again
  end

  def show_player
    print "Карты игрока: "
    game.show_card(game.player) do |card|
    print "#{card.suit}#{card.name} "
    end
    puts " Очков: #{game.player.scoring}"
  end

  def close_card_dealer
    print "Карты дилера: #{'*' * game.dealer.cards.size }"
  end

  def show_dealer
    print "Карты дилера: "
    game.show_card(game.dealer) do |card|
    print "#{card.suit}#{card.name} "
    end
    puts " Очков: #{game.dealer.scoring}"
  end

    def show_balance
      puts "#{game.player.name}: #{game.player.balance}$ | Dealer: #{game.dealer.balance}$"
    end

  def play_again
    puts 'Хотите сыграть еще раз?(Y/N)'
    input_choise = gets.strip.downcase
    input_choise == 'y' ? game.start_game : exit
  end

  def get_card_dealer
    game.add_card?
  end
end

Main.new.run
