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

  def wallet_adjustments
    @adjust_wallet_add = 
  end

end


class Menu

  def initialize
    
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
    puts "Black Jack"
    puts "RowShamBow"
    puts "Coin Toss"
    puts "Roulette"
    puts "Horse Racing"
    puts ""
    puts "View Wallet Balance"
    puts "Add Money to Wallet"
    puts "Quit"
    puts ""
  
    @game_choice = gets.strip.downcase

    case @game_choice
    when "blackjack", "black jack"
      # open black_jack app
      
    when "rowshambow", "roshambo", "roshambow", "rowshambo"
      # open rowshambow app
      
    when "coin toss", "cointoss"
      # open coin toss app
      
    when "roulette"
      # open roulette app
      
    when "horse racing", "horse race", "race"
      # open horse racing app
      
    when "quit", "q", "exit"
      # exits app
      puts "Thank you for playing!"
    when @game_choice.include? "view"
      puts "-- Wallet --".upcase
      puts ""
      puts "Your wallet balance is: $#{@player_wallet}"
    when @game_choice.include? "add"
      puts "How much money would you like to add to your wallet?"

    else 
      puts "Invalid choice. Try again."
      main_menu
    end
  end

end

Wallet.new
menu_init = Menu.new
menu_init.start
