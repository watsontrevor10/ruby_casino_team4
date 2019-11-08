class Roulette
  attr_accessor :player, :bet

    #make bet
    #choose between red or black 
    #randomizes red/black
    #if guess == computer selection then win + add money to wallet
    #if guess != computer selection then lose + minus money from wallet
      #need an if statment for each guess type: red or black 
    
	def initialize(player)
		@player = player
		puts "Welcome to Roulette!"
    @bet = nil
		@iter = 0
		start
  end
  
  def start

    puts "Please place your bet"
    print ">"
    @bet = gets.to_i
    

    win = "red" 
    if rand(2) == 0
			win = "black"
    end
    
		puts "Computer guess: #{win}" #remove eventually, for troubleshooting
    puts "Current bet: #{@bet}"
    
		if @iter > 0
			puts "Make another guess (red/black) to keep playing or press any other key to quit:"
		else
			puts "Make a guess (red/black):"
    end
    
    choice = gets.strip.downcase
    
		case choice
			when "red"
				if win == choice
					puts "You win! This time . . . "
					player.win(@bet)
				else
					puts "You lose! The house always wins . . . "
					player.lose(@bet)
				end
			when "black"
				if win == choice
					puts "You win! This time . . ."
					player.win(@bet)
				else
					puts "You lose! The house always wins . . ."
					player.lose(@bet)
				end
			else
				if @iter > 0
					puts "Thanks for playing Roulette! Good-Bye!"
					return
				else
					puts "Invalid choice."
				end
    end
    
		puts "Money: #{@player.money}"
		@iter += 1
		start
  end
  
end