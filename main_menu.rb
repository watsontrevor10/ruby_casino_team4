require_relative 'black_jack'
require_relative 'coin_toss'
require_relative 'horse_race'
require_relative 'roulette'
require_relative 'rowshambow'
require_relative 'player'
require "pry"
require "colorize"

class Menu
	attr_accessor :player, :players
	def initialize
		@players = [Player.new("Adam",350), Player.new("Bill",1000), Player.new("Broke Fool", -100)]
		@player = nil
  end
  
	def update
		@player = @user.player
		@players = @user.players
  end
  
	def start
		@user = PlayerMenu.new(@players,@player)
		@user.player_menu
		update
    puts ""
    puts "Welcome to the Casino, #{@player.name}!".bold.colorize(:cyan)

		main_menu
	end

	def main_menu
		# puts "-- Welcome to the Casino --"
		update
    puts ""
    puts "- Choose which Game you want to play -".bold.colorize(:cyan)
    puts "------------------------ GAMES! ------------------------".upcase.bold.colorize(:cyan)
    puts "Black Jack".bold.colorize(:magenta)
    puts "RowShamBow".bold.colorize(:magenta)
    puts "Coin Toss".bold.colorize(:magenta)
    puts "Roulette".bold.colorize(:magenta)
		puts "Horse Racing".bold.colorize(:magenta)
		puts ""
    puts "                   (◕_◕) Player (◕_◕)                          ".upcase.bold.colorize(:green)
    puts "View Wallet Balance".bold.colorize(:green)
		puts "View Player Menu".bold.colorize(:green)
		puts ""
    puts "Quit".bold.colorize(:red)
    puts ""
		
		if @player.money <= 0 
			puts ". . .".red
			sleep(2)
			puts "Wait! You don't even have money to play!".bold.colorize(:red)
			puts "Please select another player!".green
			sleep(2)
			@user.player = nil
			@user.swap_player
			main_menu
			return nil
		end
    @game_choice = gets.strip.downcase

  	case @game_choice
			when "blackjack", "black jack", "black"
				# open black_jack app
				#BlackJack.new(@player)
				"Sorry! All Black Jack tables are full!".bold.colorize(:red)
				sleep(2)
			when "rowshambow", "roshambo", "roshambow", "rowshambo", "rosh"
				# open rowshambow app
				ROW_SHAM_BOW.new(@player)
			when "coin toss", "cointoss", "coin", "toss"
				# open coin toss app
				Coin_toss.new(@player)
			when "roulette", "roul"
				# open roulette app
				Roulette.new(@player)
			when "horse racing", "horse race", "race", "horse"
				# open horse racing app
        HorseRace.new(@player)
      when "view wallet balance", "view wallet", "wallet", "view w"
				puts ""
        puts "#{@player.name}, your wallet has: $#{@player.money}".bold.colorize(:green)
				puts ""
				sleep(2)
      when "player menu", "view player menu", "player", "players"
        @user.player_menu
			when "quit", "q", "exit"
				# exits app
				puts "Thank you for playing!".bold.colorize(:black)
        exit
			else 
				puts "Invalid choice. Try again.".bold.colorize(:black)
		end
		sleep(0.9)
		main_menu
	end
end

menu_init = Menu.new
menu_init.start
