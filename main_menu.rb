require_relative 'black_jack'
require_relative 'coin_toss'
require_relative 'horse_race'
require_relative 'roulette'
require_relative 'rowshambow'
require "pry"
class Player
	attr_accessor :name, :wallet, :in_debt

  def initialize(name,dollars)
    # main variables
		@name = name
		@wallet = Wallet.new(dollars)
		@in_debt = false
	end
	
	# if player wins call this method with bet val
	def win(val)
		@wallet.add(val)
	end

	# if player loses call this method with bet val
	def lose(val)
		@wallet.add(-1 * val)
	end

	def view
		if @in_debt
			puts "#{@name}: $#{@wallet.amount}".red
		else
			puts "#{@name}: $#{@wallet.amount}".green
	end

	def can_select
		!@in_debt
	end

	# to show player's current money, call this method
	def money
		if @wallet.neg?
			@in_debt = true
		end
		return @wallet.amount
	end
end

class Wallet
	attr_accessor :amount
  def initialize(val)
    # main wallet variable
    @amount =  val
  end
	def add(val)
		@amount += val
	end
	def neg?
		@amount < 0
	end
end


class Menu
attr_accessor :player 
	def initialize
		@players = [Player.new("Greg",200),Player.new("Adam",350), Player.new("Bill",1000)]
		@player = nil
  end

	def start
    player_menu
    puts ""
    puts "Welcome #{@player.name}"

		main_menu
	end
	
	def player_menu
		puts "-- Current Players --".yellow
		@players.each do |player|
			player.view
		end
		
	end

  def main_menu
    puts "-- Welcome to the Casino --"
    puts ""
    puts "- Choose what you want to do -"
    puts "-- Games --".upcase
    puts "Black Jack"
    puts "RowShamBow"
    puts "Coin Toss"
    puts "Roulette"
    puts "Horse Racing"
    puts "-- Wallet --".upcase
    puts "View Wallet Balance"
    puts "Add Money to Wallet"
    puts "Quit"
    puts ""
  
    @game_choice = gets.strip.downcase

    case @game_choice
			when "blackjack", "black jack"
				# open black_jack app
				load 'black_jack.rb'
			when "rowshambow", "roshambo", "roshambow", "rowshambo"
				# open rowshambow app
				ROW_SHAM_BOW.new(@player)
			when "coin toss", "cointoss"
				# open coin toss app
				Coin_toss.new(@player)
			when "roulette"
				# open roulette app
				Roulette.new(@player)
			when "horse racing", "horse race", "race"
				# open horse racing app
        HorseRace.new(@player)
      when "view wallet balance", "view wallet", "wallet", "view"
				puts ""
        puts "#{@player.name}, your wallet has: $#{@player.money}"
				puts ""
				sleep(1.5)
      when "add money", "add"
        puts "How much money would you like to add?"
        print ">"
        @player.win(gets.to_i)
				print "#{@player.name}, you now have: $#{@player.money}"
				sleep(1.5)
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
