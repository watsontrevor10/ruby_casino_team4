
class Player
	attr_accessor :name, :wallet, :in_debt

  def initialize(name,dollars)
    # main variables
		@name = name
		@wallet = Wallet.new(dollars)
		@in_debt = false
	end
	
	# if player wins call this method with bet val
	def win(val)
		@wallet.add(val)
	end

	# if player loses call this method with bet val
	def lose(val)
		@wallet.add(-1 * val)
	end

	def view
		if @in_debt
			puts "#{@name}: $#{@wallet.amount}".red
		else
			puts "#{@name}: $#{@wallet.amount}".green
		end
	end

	def can_select
		money
		!@in_debt
	end

	# to show player's current money, call this method
	def money
		if @wallet.neg?
			@in_debt = true
		end
		return @wallet.amount
	end
end

class Wallet
	attr_accessor :amount
  def initialize(val)
    # main wallet variable
    @amount =  val
	end
	
	def add(val)
		@amount += val
	end

	def neg?
		@amount < 0
	end
	
end

class PlayerMenu
	attr_accessor :players, :player
	def initialize(players, player)
		@players = players
		@player = player
	end
		
	def player_menu
		if @player == nil
			print "NONE!".bold.colorize(:red)
			puts " Please CREATE a new player or SELECT an existing: ".yellow
			print "(create/select) > ".white
			case gets.strip.downcase
				when "s", "select"
					swap_player
				when "c", "create"
					create_player
			end
			player_menu
		else
			puts ""
			puts "Current Player: #{@player.name}".yellow
			sleep(0.5)
			puts "Loading menu...".magenta
			sleep(0.5)
			puts ""
			puts "-- Player Menu --".bold.colorize(:yellow)
			puts "View players".yellow
			puts "Create new player".green
			puts "Switch players".yellow
			puts "Retire player".red
			puts "Main Menu".yellow
			print "> ".bold.colorize(:white)
			choice = gets.strip.downcase
			if choice == "q" || choice == "quit" || choice == "m" || choice == "menu" || choice == "main menu"
				return choice if choice 
			else
				case choice
					when "v", "view", "players", "view players"
						view_players
						sleep(1.2)
						player_menu
					when "c", "create", "new", "create new player"
						create_player
					when "switch", "s", "change", "swap", "sw", "switch players", "switch player"
						swap_player
					when "r", "ret", "re", "retire", "delete", "retire player", "retire players"
						retire_player
					else
						puts "Invalid choice. Try again!".red
						sleep(0.5)
				end
				player_menu
			end
		end
	end

	def view_players
		puts "-- Current Players --".yellow
		if @players.empty?
			puts "No players in the casino!".bold.colorize(:red)
		else
			@players.each do |player|
				player.view
			end
		end
	end
	def swap_player
		init = nil
		if @player != nil
			init = @player.name
		end
		view_players
		unless @players.empty?
			@players.each do |player|
				unless player.in_debt
					puts "Choose #{player.name}?".bold.colorize(:yellow)
				else
					puts "Choose #{player.name}?".bold.colorize(:red)
				end
					print "y or any key for next player > ".bold.colorize(:white)
					case gets.strip.downcase
						when "y"
							if player.can_select
								@player = player
							else
								sleep(1.5)
								puts "Hmm...".bold.colorize(:yellow)
								sleep(1)
								puts "Player was no where to be found.".bold.colorize(:red)
								sleep(1)
								swap_player
								return
							end
							break
						when "q", "quit"
							break
					end
			end
		end
		if @player == nil
			puts "No player selected! You must select a player to play in the casino!".red
			puts "Would you like to create your own?".green
			print "y to create new, exit to leave the casino, any key for an existing player > ".bold.colorize(:white)
			choice = gets.strip.downcase
			case choice
				when 'y'
					create_player
				when 'exit'
					exit
				else
					swap_player
			end
		elsif init != @player.name
			puts "You are now playing as #{@player.name}".bold.colorize(:green)
			sleep(1.5)
		elsif init == @player.name
			puts "No swap occured.".black
			sleep(1.5)
		end
	end

	def retire_player(player = nil)
		view_players
		unless player == nil
			puts "#{player.name} has the left the casino.".red
			sleep(2)
			@players -= [player]
			if @player == player
				@player = nil
				puts "Your player has left!".bold.colorize(:red)
			end
			return nil
		else
			puts "Choose a player to retire:".yellow
			@players.each do |p|
				puts "Retire #{p.name}?".red
				print "y or any key to continue > ".bold.colorize(:white)
				case gets.strip.downcase
					when'y'
						retire_player(p)
						if @player == nil
							puts "Loading...".magenta
							sleep(1)
							swap_player
							break
						end
					when 'q', 'quit'
						break
				end
			end
		end
	end
	def create_player
		puts "Enter player name:".bold.colorize(:black)
		puts ">".bold.colorize(:white)
		n = gets.strip
		money = 0
		while true
			puts "Enter starting money:".bold.colorize(:green)
			puts ">".bold.colorize(:white)
			money = gets.to_i
			if money >= 200
				break
			end
			puts "Oops! You need atleast ".red + "$200".green + " to enter the casino!".red
		end
		@player = Player.new(n,money)

		@players.each do |p|
			if p.name == @player.name
				puts "Oops! Player already exists!".red
				sleep(1.5)
				puts "Retire old player?".bold.colorize(:yellow)
				puts "Y to retire, any other key to create different player."
				choice = gets.strip
				if choice != 'y' && choice != 'Y'
					create_player
				else
					retire_player(p)
				end
			end
		end
		@players.push(@player)
		puts "Player #{@player.name} created!".green
	end
end