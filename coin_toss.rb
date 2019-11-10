# Trevor
class Coin_toss
  attr_accessor :player, :bet
  
	def initialize(player)
		@player = player
		puts "Welcome to Coin Toss!"
		@bet = 5
		@iter = 0
		start
  end
  
	def start
		win = "h"
		if rand(2) == 0
			win = "t"
		end
		puts "Computer guess: #{win}"
		puts "Current bet: #{@bet}"
		if @iter > 0
			puts "Make another guess (H/T) to keep playing or press any other key to quit:"
		else
			puts "Make a guess (H/T):"
    end
    
		choice = gets.strip.downcase
		case choice
			when "h"
				if win == choice
					puts "You win!"
					player.win(@bet)
				else
					puts "You lose!"
					player.lose(@bet)
				end
			when "t"
				if win == choice
					puts "You win!"
					player.win(@bet)
				else
					puts "You lose!"
					player.lose(@bet)
				end
			when "q", "quit"
				puts "Thanks for playing!"
				return nil
			else
				if @iter > 0
					puts "Thanks for playing Coin Toss! Good-Bye!"
					return nil
				else
					puts "Invalid choice."
				end
		end
    
    puts "Money: #{@player.money}"
		@iter += 1
		start
	end
end