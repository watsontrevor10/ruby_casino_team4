# Jacob
#require_relative "main_menu"

class HorseRace

  def initialize(player)
    @player = player
    start_game  
  end
  
  def start_game
    @horses = ["Captain", "Lucky", "Last Chance", "Admiral"]
    
    puts "Welcome to the Racetrack!"
    puts "Plese select a horse."
    puts "--- Horses ---"
    
    @horses.each_with_index do |horse, index|
      puts "#{index + 1}. #{horse}"
    end
    
    print "Selection: >"
    player_horse = @horses[gets.to_i - 1]
    
    print "Place a bet: >"
    bet = gets.to_i
    
    winning_horse = @horses.sample
    puts "#{winning_horse} wins!!!"

    case winning_horse
      when player_horse
        puts "You are a winner!"
        @player.win(bet)
      else
        puts "You lost better luck next time!"
        @player.lose(bet) 
    end 
    
  end
  
end


