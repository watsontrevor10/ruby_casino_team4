# Jacob
#require_relative "main_menu"

class HorseRace

  def initialize(player)
    @horses = ["Captain", "Lucky", "Last Chance", "Admiral"]
    @player = player
    start_game  
  end
  
  def start_game
    player_horse = select_horse
    bet = place_bet

    puts "On your mark."
    sleep(3)
    puts "Get set."
    sleep(3)
    puts "Race!!!"
    sleep(3)
    puts "And there off!"
    sleep(3)
    puts "#{@horses.sample} takes the lead!"
    sleep(3)
    puts "Oh #{@horses.sample} pulls ahead!"
    sleep(3)
    puts "Its neck and neck!"
    sleep(3)

    winning_horse = @horses.sample
    puts "#{winning_horse} wins!!!"
    sleep(3)
    
    case winning_horse
    when player_horse
      puts "You are a winner!"
      @player.win(bet)
    else
      puts "You lost better luck next time!"
      puts "Money: #{@player.money}."
      @player.lose(bet) 
    end 
    
    puts "Money: #{@player.money}."
  end
  
  def select_horse
    puts "Welcome to the Racetrack!"
    puts "Plese select a horse."
    puts "--- Horses ---"
    
    @horses.each_with_index do |horse, index|
      puts "#{index + 1}. #{horse}"
    end
    
    print "Selection: >"
    return @horses[gets.to_i - 1]
  end
  
  def place_bet
    puts "Money: #{@player.money}"
    print "Place a bet: >"
    bet = gets.to_i

    if bet > @player.money
      puts "Invalid bet"
      place_bet
    end
    
    return bet
  end
  
end


