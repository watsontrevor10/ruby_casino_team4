# Trevor
class Coin_toss
  attr_accessor :player, :bet
  
	def initialize(player)
		@player = player
		puts "\nWelcome to Coin Toss!".bold.colorize(:cyan)
		@bet = 5
		@iter = 0
		start
  end
  
	def start
		win = "h"
		if rand(2) == 0
			win = "t"
		end
		puts "Computer guess: #{win}".bold.colorize(:black)
		puts "Current bet: #{@bet}".bold.colorize(:black)
		if @iter > 0
			puts "Make another guess (H/T) to keep playing or press any other key to quit:".bold.colorize(:cyan)
		else
			puts "Make a guess (H/T):".bold.colorize(:black)
    end
    
		choice = gets.strip.downcase
    
    case choice 
			when "h"
				if win == choice
					puts "You win!".bold.colorize(:yellow)
					player.win(@bet)
				else
					puts "You lose!".bold.colorize(:red)
					player.lose(@bet)
				end
			when "t"
				if win == choice
					puts "You win!".bold.colorize(:yellow)
					player.win(@bet)
				else
					puts "You lose!".bold.colorize(:black)
					player.lose(@bet)
				end
			when "q", "quit"
				puts "Thanks for playing!"
				return nil
			else
				if @iter > 0
<<<<<<< HEAD
					puts "Thanks for playing Coin Toss! Good-Bye!"
					return nil
=======
					puts "Thanks for playing Coin Toss! Good-Bye!".bold.colorize(:cyan)
					return
>>>>>>> dfb69a6c86c1419d240da19e168f931c89a299e1
				else
					puts "Invalid choice.".bold.colorize(:red)
				end
		end
    
    puts "Money: #{@player.money}"
		@iter += 1
		start
	end
end