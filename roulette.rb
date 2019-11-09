
class Roulette
  attr_accessor :player, :bet, :color_start

	def initialize(player)
    @player = player
    puts ""
    puts "-- Welcome to Roulette! --".upcase.colorize(:green)
    @bet = nil
    @iter = 0
    @black = [2, 4, 6, 8, 10, 11, 13, 15, 17, 20, 22, 24, 26, 28, 29, 31, 33, 35]
    @red = [1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36]
    bet_type_initiator
  end
  
  def bet_type_initiator 
    puts ""
    puts "What type of bet do you want to place: Color or Number?"
    print "> "
    
    @bet_type = gets.strip.downcase

    case @bet_type
      when "quit", "q"
        puts ""
        puts "Thank you for playing"
        return nil
      when "color" 
        puts "Do you bet on Red or Black?"
        puts "> "
        @color_choice = gets.strip.downcase
        color_bet_checker
      when "number"
        puts "Pick a number between 1 - 36"
        puts "> "
        @number_choice = gets.to_i
        puts "Place your bet!"
        print "> "
        @bet = gets.to_i
        number_start
      else  
        puts "Invalid choice, try again"
        bet_checker     
    end

  end

def color_bet_checker
  
  if @color_choice.include? "red" || "black"
    @color_win = "red" 
      if rand(2) == 0
			@color_win = "black"
      end
    puts "Place your bet!"
    print "> "
    @bet = gets.to_i
    color_start
  else 
    puts "Invalid response, try again."
    bet_type_initiator
  end
end

def color_start

	#	puts "Computer guess: #{win}" #remove eventually, for troubleshooting
  puts ""  
  puts "Current bet: #{@bet}"
    
    # if @iter > 0
    #   puts ""
		# 	puts "Make another guess (red/black) to keep playing or press any other key to quit:"
    # else
    #   puts ""
		# 	puts "Make a guess (red/black):"
    # end
    
    #choice = gets.strip.downcase
    
	case @color_choice
    when "red"
      if @color_win == @color_choice
        puts ""
				puts "You win! This time . . . ".colorize(:green)
				player.win(@bet)
      else
        puts ""
				puts "You lose! The house always wins . . . ".colorize(:red)
				player.lose(@bet)
			end
		when "black"
      if @color_win == @color_choice
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
		bet_type_initiator
  end
  
  def number_start
    number_win = 1 + rand(36)

    puts "*Wheel Spinning*"
    sleep(2)
    
    if @red.include? @number_choice
      if number_win == @number_choice
        player.lose(@bet * 35)
        puts "Congrats!  You Win!"
        puts ""
        #puts "Your wallet is now: $#{@player.money}"
      else 
        player.lose(@bet * 35)
        puts "Sorry, you lose!  LOL!"
        puts ""
        #puts "Your wallet is now: $#{@player.money}"
      end
    else
      if number_win == @number_choice
        player.lose(@bet * 35)
        puts "Congrats!  You Win!"
        puts ""
        #puts "Your wallet is now: $#{@player.money}"
      else 
        player.lose(@bet * 35)
        puts "Sorry, you lose!  LOL!"
        puts ""
        #puts "Your wallet is now: $#{@player.money}"
      end
    end
  
    puts ""
		puts "You now have: $#{@player.money} in your Wallet".colorize(:blue)
		@iter += 1
		bet_type_initiator
  end

end

 #make bet
    #choose between red or black 
    #randomizes red/black
    #if guess == computer selection then win + add money to wallet
    #if guess != computer selection then lose + minus money from wallet
      #need an if statment for each guess type: red or black 

      # add numbers 0-36, alternates between black and red
      # Black

# Black - 0, 2, 4, 6, 8, 10, 11, 13, 15, 17, 20, 22, 24, 26, 28, 29, 31, 33, 35
# Red - 1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36

# 1 + rand(36) 
# if @red.include? computer
# OR 
# Red || black

# Bet a number or color? 

# Which number? 
# OR
# Which color? 

# Payout 

# Single number = 35*bet
# Color = 1*bet