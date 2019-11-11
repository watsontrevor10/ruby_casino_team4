# Jacob
require "colorize"

class HorseRace

  def initialize(player)
    @horses = ["Captain", "Lucky", "Last Chance", "Admiral"]
    @player = player
    start_game  
  end
  
  def start_game
    welcome_banner
    player_horse = select_horse
    bet = place_bet
    race_start
    first_lap
    second_lap
    third_lap

    sleep(3)
    winning_horse = @horses.sample
    puts "#{winning_horse} wins!!!"
    sleep(3)
    
    case winning_horse
    when player_horse
      puts "You are a winner!".colorize(:green)
      @player.win(bet)
    else
      puts "You lost better luck next time!".colorize(:red)
      #puts "Money: #{@player.money}."
      @player.lose(bet) 
    end 
    
    puts "Money: $#{@player.money}."
  end
  
  def select_horse
    puts "Please select a horse."
    puts "--- Horses ---"
    
    @horses.each_with_index do |horse, index|
      puts "#{index + 1}. #{horse}".colorize(:green)
    end
    
    print "Selection: >"
    return @horses[gets.to_i - 1]
  end
  
  def place_bet
    puts "Money: $#{@player.money}"
    print "Place a bet: >"
    bet = gets.to_i
    
    if bet > @player.money
      puts "Invalid bet"
      place_bet
    end
    
    return bet
  end
  
  def welcome_banner
    puts `clear`
    puts "~___/>  ~___/>    ~___/> "
    puts " | |     | |       | |   "
    puts "-------------------------"
    puts "Welcome to the Racetrack!"
    puts "-------------------------"
  end
  
  def race_start
    puts `clear`
    puts "On your mark."
    sleep(3)
    puts "Get set."
    sleep(3)
    puts "Go!!!"
    sleep(3)
    puts `clear`
    puts "And they're off!"
    puts " ~___/>  ~___/>  ~___/> ~___/>"
    puts " |  |     |  |    |  |   |  | "
  end
  
  def first_lap
    sleep(3)
    puts `clear`
    puts "#{@horses.sample} takes an early lead!"
    puts " ~___/>  ~___/>  ~___/>      ~___/>"
    puts " |  |     |  |    |  |       |  |  "  
  end
  
  def second_lap
    sleep(3)
    puts `clear`
    puts "Oh no #{@horses.sample} falls behind!"
    puts " ~___/>       ~___/>  ~___/> ~___/>"
    puts " |  |          |  |    |  |   |  | "
  end
  
  def third_lap
    sleep(3)
    puts `clear`
    puts "#{@horses.sample} pulls ahead!"
    puts " ~___/>  ~___/>  ~___/>      ~___/>"
    puts " |  |     |  |    |  |       |  |  " 
    sleep(3)
    puts `clear`
    puts "It's neck and neck!"
    puts " ~___/>  ~___/>  ~___/> ~___/>"
    puts " |  |     |  |    |  |   |  | "
  end
  
end


