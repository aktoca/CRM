require './manager'
require './score'

class Ui


  def initialize
   @manager = Manager.new
  end

  def main_menu
    puts "1. Guessing Game"
    puts "2. Change your score"
    puts "3. See your total score"
  end

  def change_points
    puts "how many points to you want"
    new_amnt = gets.chomp.to_i
    puts @manager.change_points(new_amnt)
    puts @manager.score_board
    puts "HA! you can't just make up points for yourself"
    puts "They are a class variable."
    puts "You have to earn them  through the game."
    run

  end


  def more?(say)
    puts "#{say}? y/n"
    input = gets.chomp
    if input == 'y' then true
    elsif input == 'n' then false
    end
  end

  def turn
    playing = true
    #while playing
      5.times do        
        print "\nEnter a number between 1-10: "
        guess = gets.chomp.to_i
        #guess.is_a?(Integer) ? (guess = guess.to_i) : (puts "not a number bub try ")
        number =  rand(10).to_i
        puts "The random number is: #{number}"
        result = @manager.tally(guess,number)
        if result == 0
          puts "no points for you" 
        elsif result == 2
          puts "nice guess"
        elsif result == 1
          puts "one point"
        end  
      end 
      puts "\e[H\e[2J" 
      puts "That's the game"
      #playing = more?("Play again") 
    #end
    @manager.finalize
    run
  end

  def score_board
    puts "\e[H\e[2J" 
    puts "==========\nTotal Points\n=========="
    puts @manager.score_board
    gets.chomp
    puts "\e[H\e[2J"
    run
  end

  def game
    puts "\e[H\e[2J" 
    puts "This is a guessing game"
    puts "Are you ready to play #{@manager.display_name}"
    puts "==========\nRULES\n=========="
    puts "\n* You have five turns"
    puts "* guess the random number (two points)"
    puts "* if your guess is within 2 numbers you get one point" 
    puts "* otherwise it's Zero, with a capitol ZED"
    puts "press enter to begin"
    gets.chomp
    puts "\e[H\e[2J" 
    turn
  end



  def run
    puts "What would you like to do?"
    main_menu
    choice = gets.chomp
    if choice.to_i == 1
      game
    elsif choice.to_i == 2
      change_points
    elsif choice.to_i == 3
      score_board      
    else
      puts "comming soon"
    end
  end

  def start
    puts "***************\nWELCOME!\n***************"
    puts "Please enter your name:"
    name = gets.chomp
    @manager.create_user(name)
    run
  end 

end

user =Ui.new
user.start