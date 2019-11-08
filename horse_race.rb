# Jacob
requrie_relative "main_menu"

class HorseRace

  def initialize
    @player 
    @horses = ["Captain", "Lucky", "Last Chance", "Admiral"]

    puts "Welcome to the Racetrack!"
    puts "Plese select a horse."
    puts "--- Horses ---"

    @horses.each_with_index do |horse, index|
      puts "#{index}. #{horse}"
    end

  end

end

HorseRace.new