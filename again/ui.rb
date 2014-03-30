require './manager'
require './score'

class Ui


  def initialize
   @manager = Manager.new
  end

  def main_menu
    puts "1. Guess"
    puts "2. Repeat"
  end


  def more(say)
    puts "#{say}? y/n"
    input = gets.chomp
    if input == 'y' then true
    elsif input == 'n' then false
    else (puts "what was that")
    end
  end

  def turn
    done = false
    while !done        
      puts "\nEnter a number between 1-10:"
      guess = gets.chomp.to_i
      #guess.is_a?(Integer) ? (guess = guess.to_i) : (puts "not a number bub try ")
      number =  rand(10).to_i
      result = @manager.tally(guess,number)
      if result == -1
        puts "no points for you" 
      elsif result == 0
        puts "how'd you do that?"
      elsif result == 1
        puts "fine one point, but that's it"
      end    
      turn if more("Play again") == true  
      game 
    end
  end

  def score_board
  end

  def game
    puts "\e[H\e[2J" 
    puts "This is a guessing game #{@manager.display_name}"
    puts "==========\nRULES\n=========="
    puts "* guess the random number and you get two points"
    puts "* if your guess is within 2 nummers you get one"
    puts "* otherwise it's Zero, with a capitol ZED"
    puts "press enter to begin"
    gets.chomp
    puts "\e[H\e[2J" 
    turn
  end

  def repeat
    puts "almost"
  end

  def run
    puts "WELCOME!"
    puts "Please enter your name:"
    name = gets.chomp
    @manager.create_user(name)
    puts "What kind of game do you want to play #{name}?"
    main_menu
    choice = gets.chomp
    if choice.to_i == 1
      game
    elsif choice.to_i == 2
      repeat
    else
      puts "comming soon"
    end
  end

end

user =Ui.new
user.run