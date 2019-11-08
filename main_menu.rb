require_relative 'black_jack'
require_relative 'coin_toss'
require_relative 'horse_race'
require_relative 'roulette'
require_relative 'rowshambow'

class Player
	attr_accessor :name, :wallet

  def initialize(name)
    # main variables
		@name = name
		@wallet = Wallet.new
	end
	
	# if player wins call this method with bet val
	def win(val)
		@wallet.add(val)
	end

	# if player loses call this method with bet val
	def lose(val)
		@wallet.add(-1 * val)
	end

	def kick
		puts "You are broke, good bye!"
		exit
	end

	# to show player's current money, call this method
	def money
		if @wallet.neg?
			kick
		end
		return @wallet.player_wallet
	end
end


class Wallet
	attr_accessor :player_wallet
  def initialize
    # main wallet variable
    @player_wallet = 50
  end
	def add(val)
		@player_wallet += val
	end
	def neg?
		@player_wallet < 0
	end
end


class Menu

  def initialize
  end

  def start
    puts "What is your name"

    @player = Player.new(gets.strip)
    puts ""
    puts "Welcome #{@player.name}"

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
    puts "Quit"
    puts ""
  
    @game_choice = gets.strip.downcase

    case @game_choice
			when "blackjack", "black jack"
				# open black_jack app
				load 'black_jack.rb'
			when "rowshambow", "roshambo", "roshambow", "rowshambo"
				# open rowshambow app
				load 'rowshambow.rb'
			when "coin toss", "cointoss"
				# open coin toss app
				Coin_toss.new(@player)
			when "roulette"
				# open roulette app
				load 'roulette.rb'
			when "horse racing", "horse race", "race"
				# open horse racing app
				HorseRace.new(@player)
			when "quit", "q", "exit"
				# exits app
				puts "Thank you for playing!"
				exit
			else 
				puts "Invalid choice. Try again."
		end
		main_menu
	end
end

Wallet.new
menu_init = Menu.new
menu_init.start
