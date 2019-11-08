# Jacob
require_relative "main_menu"

class HorseRace

  def initialize(player)
    @player = player
    @horses = ["Captain", "Lucky", "Last Chance", "Admiral"]

    puts "Welcome to the Racetrack!"
    puts "Plese select a horse."
    puts "--- Horses ---"

    @horses.each_with_index do |horse, index|
      puts "#{index}. #{horse}"
    end

    print "Selection: >"
    player_horse = gets.strip

    print "Place a bet: >"
    bet = gets.to_i

    winning_horse = @horses.sample
    "#{winning_horse} wins!!!"

    case winning_horse
      when player_horse
         "You are a winner!"
      else
        "You lost better luck next time!" 
    end 

  end

end

HorseRace.new()