# Tristan
require_relative "deck"

class BlackJack

	def initialize(player)
		@player = player
		@deck = Deck.new
		@bet = 0
		puts "Welcome to Black Jack!"
		select_bet
	end
	def select_bet
		puts "Place Bet: ".yellow
		puts "Money: #{@player.money}".green
		@bet = gets.to_i
		if @bet <= 0 || @bet > @player.money * 2
			puts "Invalid Bet. Must be greater than 0 and less than #{@player.money * 2}".red
			select_bet
		elsif @bet > @player.money
			puts "Warning! Bet is larger than your current dollar amount!".bold.colorize(:red)
			while true
				print "Continue? (Y/N) > ".yellow
				case gets.strip.downcase
					when 'y'
						break
					when 'n'
						select_bet
						break
				end
			end
		else
			start
		end
	end
	def start
		
	end
end

