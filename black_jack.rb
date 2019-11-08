# Tristan
require_relative "deck"

class BlackJack

	def initialize(player)
		@player = player
		@deck = Deck.new
		puts "Welcome to Black Jack!"
		select_bet
		start
	end
	def select_bet
		puts "Place Bet: "
		puts "Money: #{@player.wallet}"
	end
end

