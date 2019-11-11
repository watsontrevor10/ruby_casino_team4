
class Roulette
  attr_accessor :player, :bet, :color_start

	def initialize(player)
    @player = player
    system 'clear'
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
    puts "What type of bet do you want to place: " + "Color ".green + "or " + "Number?".black
    print "> "
    
    @bet_type = gets.strip.downcase

    case @bet_type
      when "quit", "q"
        puts ""
        puts "Thank you for playing".colorize(:green)
        return nil
      when "color" 
        puts "Do you bet on " +"Red ".colorize(:red) + "or Black?".colorize(:black)
        puts "> "
        @color_choice = gets.strip.downcase
        color_bet_checker
      when "number"
        puts "Pick a number between 1 - 36"
        puts "> "
        @number_choice = gets.to_i
          if @number_choice < 1 || @number_choice > 36
            puts "Invalid choice, try again".red
            bet_type_initiator
          else
            puts "Place your bet!".orange
            print "> "
            @bet = gets.to_i
            number_start
          end
      else  
        puts "Invalid choice, try again".red
        bet_type_initiator     
    end
  end

def color_bet_checker
  
  if @color_choice.include? "red" || "black"
    @color_win = "red" 
      if rand(2) == 0
			@color_win = "black"
      end
    puts "Place your bet!".orange
    print "> "
    @bet = gets.to_i
    color_start
  else 
    puts "Invalid response, try again.".red
    bet_type_initiator
  end
end

def color_start

	#	puts "Computer guess: #{win}"  (for troubleshooting)
  puts ""  
  puts "Current bet: #{@bet}"
  puts ""
  puts "Wheel Spinning . . . ".yellow
  sleep(2)
    
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
      puts "Thank you for playing".yellow
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
    puts ""
    sleep(2)

    if @red.include? @number_choice
      if number_win == @number_choice
        player.lose(@bet * 35)
        puts "Congrats!  You Win!"
        puts ""
        #puts "Your wallet is now: $#{@player.money}"
      else 
        player.lose(@bet * 35)
        puts "Sorry, you lose!  LOL!".colorize(:red)
        puts ""
        #puts "Your wallet is now: $#{@player.money}"
      end
    else
      if number_win == @number_choice
        player.lose(@bet * 35)
        puts "Congrats!  You Win!".green
        puts ""
        #puts "Your wallet is now: $#{@player.money}"
      else 
        player.lose(@bet * 35)
        puts "Sorry, you lose!  LOL!".red
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

 