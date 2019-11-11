# Trevor
class Coin_toss
  attr_accessor :player, :bet
  
	def initialize(player)
		@player = player
		puts "\nWelcome to Coin Toss!".bold.colorize(:cyan)
		@bet = 5
		@iter = 0
		select_bet
	end
	def select_bet
		unless @player.can_select
			puts "Sorry, but you owe us money. Please return when you have the funds.".red
			puts "Money: #{@player.money}".bold.colorize(:red)
			return nil
		end
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
						start
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
		win = "h"
		if rand(2) == 0
			win = "t"
		end
		puts "Current bet: #{@bet}".bold.colorize(:black)
		if @iter > 0
			puts "Make another guess (H/T) to keep playing, b to bet again, or any other key to quit:".bold.colorize(:cyan)
		else
			puts "Make a guess (H/T):".bold.colorize(:black)
		end
		
		if @player.money < -1000
			sleep(1.5)
			puts "Hold up!".red
			sleep(1)
			puts "You owe us over a grand!".red
			sleep(1)
			puts "Bouncer, show this fool the door!".bold.colorize(:red)
			sleep(2)
			return nil
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
			when 'b'
				select_bet
				return nil
			when "q", "quit"
				puts "Thanks for playing!"
				return nil
			else
				if @iter > 0
					puts "Thanks for playing Coin Toss! Good-Bye!".bold.colorize(:cyan)
					return
				else
					puts "Invalid choice.".bold.colorize(:red)
				end
		end
    
    puts "Money: #{@player.money}"
		@iter += 1
		start
	end
end