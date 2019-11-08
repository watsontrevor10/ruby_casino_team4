require_relative 'black_jack'
require_relative 'coin_toss'
require_relative 'horse_race'
require_relative 'roulette'
require_relative 'rowshambow'

class Player
attr_accessor :name

  def initialize
    # main variables
    @player_name = nil
  end

end


class Wallet

  def initialize
    # main wallet variable
    @player_wallet = 50
  end

end


class Menu

  def initialize
    @player = Player.new 
  end

  def start
    puts "What is your name"

    @player_name = gets.strip
    puts ""
    puts "Welcome #{@player_name}"

    main_menu
  end

  def main_menu
    puts "-- Welcome to the Casino --"
    puts ""
    puts "- Choose what you want to do -"
    puts ""
    puts "RowShamBow"
    puts "Coin Toss"
    puts "Roulette"
    puts "Horse Racing"
    puts "Quit"
    puts ""
  
    @game_choice = gets.strip.downcase

    case @game_choice
    when "rowshambow", "roshambo", "roshambow", "rowshambo"
      # open rowshambow app
      load 'rowshambow.rb'
    when "coin toss", "cointoss"
      # open coin toss app
      load 'coin_toss.rb'
    when "roulette"
      # open roulette app
      load 'roulette.rb'
    when "horse racing", "horse race", "race"
      # open horse racing app
      load 'horse_race.rb'
    when "quit", "q", "exit"d
      # exits app
      puts "Thank you for playing!"
    else 
      puts "Invalid choice. Try again."
      main_menu
    end
  end

end

Wallet.new
menu_init = Menu.new
menu_init.start
