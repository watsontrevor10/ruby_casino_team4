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
    puts ""
    puts "-- Welcome to Roulette! --".upcase.colorize(:green)
    @bet = nil
    @iter = 0
    bet_checker
  end
  
  def bet_checker 
    puts ""
    puts "Please place your bet. (type quit to exit)"
    print "> "
    
    @bet = gets.strip.downcase

  case @bet
    when "quit", "q"
      puts ""
      puts "Thank you for playing"
      return nil
    else 
      @bet = @bet.to_i
    if @bet > @player.money 
      puts ""
      puts "You do not have enough money.  Your balance is currently: $#{player.money}"
      @bet = nil
      bet_checker
    else  
      start      
    end
  end

end

  def start

    win = "red" 
    if rand(2) == 0
			win = "black"
    end
    
	#	puts "Computer guess: #{win}" #remove eventually, for troubleshooting
  puts ""  
  puts "Current bet: #{@bet}"
    
    if @iter > 0
      puts ""
			puts "Make another guess (red/black) to keep playing or press any other key to quit:"
    else
      puts ""
			puts "Make a guess (red/black):"
    end
    
    choice = gets.strip.downcase
    
		case choice
			when "red"
        if win == choice
          puts ""
					puts "You win! This time . . . ".colorize(:green)
					player.win(@bet)
        else
          puts ""
					puts "You lose! The house always wins . . . ".colorize(:red)
					player.lose(@bet)
				end
			when "black"
        if win == choice
          puts ""
					puts "You win! This time . . .".colorize(:green)
					player.win(@bet)
        else
          puts ""
					puts "You lose! The house always wins . . .".colorize(:red)
					player.lose(@bet)
        end
      when "quit", "q"
        puts ""
        puts "Thank you for playing"
        return
			else
        if @iter > 0
          puts ""
					puts "Thanks for playing Roulette! Good-Bye!"
					return nil
        else
          puts ""
					puts "Invalid choice.".colorize(:red)
				end
    end
    
    puts ""
		puts "You now have: $#{@player.money} in your Wallet".colorize(:blue)
		@iter += 1
		bet_checker
  end
  
end