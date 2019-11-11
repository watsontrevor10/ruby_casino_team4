# David

# Ruby Casino

# Group Project Setup

# Only one person needs to create the GitHub repo so choose someone to be the group leader and have them create a repo on GitHub.
# The team lead will need to add the rest of the team as collaborators.
# To do this, click on the settings tab and click on the Collaborators & Teams side menu.
# Add the rest of the team by email or username. 
# Everyone else on the team will need to clone the project to their local computers.
# To do this, go the code (main screen) tab on the repo and click the green clone or download button on the right.
# Make sure the title of new menu says Clone with SSH (if not click the link in the top corner that says use SSH) and grab the link in the text box.
# On your local computer, make sure you are in the current directory you want the project to exist (dpl/week1) and type  git clone [SHH that you copied]
 
# Basic Objectives:

# Start game player has a name and a wallet
# Player can go to different games via menu
# Slots
# High / Low
# Use classes to start the casino, bankroll, and each individual game
# Player places bet and wins / loses (hint: rand)
# The player should have a Wallet and the Wallet should be its own class with remove and add methods (OOP)
# Player's bankroll goes up and down with wins and losses
# Ability to move to and from games

# Bonus Objectives:

# Find a gem that allows you to play sound and find casino sounds that will play on each game change/events
# Gem discovery: go to rubygems.org and find more gems that you want to implement in your project and use
# Find ASCII Art and put it into your games/menus to make it more fun for the end user
# Ability to switch players (player menu, bankroll information)
# Player's bankroll persists while moving from game to game
# Player's bankroll persists if you switch to different players
# Random events occur when changing games that can increase or decrease player's bankroll
# Roulette
# Craps
# Build a card deck (hint: this is in today's lesson content)
# Card games (Blackjack, Poker, Casino War, etc...)
# Any other Casino game you can think of
# Create your own game

# NOTES:

# I highly recommend that once you complete a game in the casino go back through all of the code as a group and refactor it. Look for any code that is not DRY (Don't repeat yourself) and move it into common methods. Look for things that can be used in variables etc... If you have any questions about refactoring please find any of the TA's or me and we can assist you with it!
 # RoW-Sham-Bow
 require "pry"
 require "colorize"
#  require_relative "main_menu"
 
#  class game 
 
  class ROW_SHAM_BOW
 
    def initialize(player)
      @player= player
      @name = player.name
        puts "------------------------- ROW-SHAM-BOW! -------------------------".bold.colorize(:green)
        puts "Welcome #{@name}! You are not ready for this! ".bold.colorize(:black)
        game_play
    end

    def game_play
      puts "************************   MENU   ************************".bold.colorize(:red)
      puts " 1) Rock".bold.colorize(:yellow)
      puts " 2) Paper".bold.colorize(:yellow)
      puts " 3) Scissor".bold.colorize(:yellow)
      puts " 4) Wimp out".bold.colorize(:yellow)
      puts "Choose 1 - 3 #{@name}:".bold.colorize(:purple)
      choice = gets.to_i

      if choice < 4 
        print "Place your BET! fool!".bold.colorize(:black)
        @bet = gets.to_i
          if @bet > @player.money 
            puts ""
            puts "You don't have that kind of cash!".bold.colorize(:red)
            puts ""
            game_play
          end
      end 

       case choice
       when 1
        puts "rock "
        rock
       when 2 
        puts "paper"
        paper
       when 3
        puts "scissor"
        scissor
       when 4
        puts "GO CRY TO MOMMA #{@name}!!!".bold.colorize(:red)
        puts "#{@name} YOU ARE BROKE ANYWAYS".bold.colorize(:red)
        return
       else
         puts "Invalid"
         game_play
       end
       game_play
    end

    def computer
      cpu = ["rock", "paper", "scissor"]
       cpu.sample
    end

    def win
        puts "Really you WON #{@name}!".bold.colorize(:green)
        puts "That was ALL LUCK!!!".bold.colorize(:green)
        @player.win(@bet)
        puts "Money $#{@player.money}"
    end

    def lose
      puts "haha #{@name} you're a Loser!".bold.colorize(:red)
      puts "YOU SUCK! hahaha".bold.colorize(:red)
      @player.lose(@bet)
      puts "Money $#{@player.money}"
    end

    def tie
      puts "Really a TIE!".bold.colorize(:black)
      puts "whatever then #{@name}".bold.colorize(:black)
    end
    
    # def out 
    #   puts "GO CRY TO MOMMA #{@name}!!!".bold.colorize(:red)
    #   puts "#{@name} YOU ARE BROKE ANYWAYS".bold.colorize(:red)
    #   return
    # end

    def rock      
      case  computer
        when "rock"
            puts "CPU: chose ROCK!"
            tie
        when "paper"
          puts "CPU: chose PAPER!"
          lose
        when "scissor"
          puts "CPU: chose scissor!"
          win
        else
          puts "ERROR! "
          game_play
      end
    end

    def paper
      case  computer
      when "rock"
          puts "CPU: chose ROCK!"
          win
      when "paper"
        puts "CPU: chose PAPER!"
        tie
      when "scissor"
        puts "CPU: chose scissor!"
        lose
      else
        puts "ERROR! "
        game_play
    end
    end

    def scissor
      case  computer
      when "rock"
        puts "CPU: chose ROCK!"
        lose
      when "paper"
        puts "CPU: chose PAPER!"
        win
      when "scissor"
        puts "CPU: chose scissor!"
        tie
      else
        puts "ERROR! ".bold.colorize(:black)
        game_play
    end
    end

   end
 
  