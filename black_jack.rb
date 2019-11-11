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
		puts "Place Bet: "
		puts "Money: #{@player.wallet}"
		@bet = gets.to_i
		if @bet <= 0 || @bet > @player.wallet
			puts "Invalid Bet."
			select_bet
		else
			start
		end
	end
	def start
		
	end
end

