require './manager'
require './score'

class Ui


  def initialize
    @manager = Manager.new
  end


  def more(say)
    puts "#{say}? y/n"
    input = gets.chomp
    # if input != 'y' ||  input != 'n'
    #   puts "try again dummby"
    #   more
    # else
    #   input == 'y'
    # end
  end

  def turn
    @manager = Manager.new
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
      @manager.board      
    end
  end

  def game
    puts "\e[H\e[2J" 
    puts "this is a guessing game"
    puts "if you can guess the number you get two points"
    puts "if you guess under you get one"
    puts "but if you guess over it's Zero, with a capitol ZED"
    gets.chomp
    turn
  end

  def run
    puts "WELCOME!"
    puts "Please enter your name"
    name = gets.chomp
    @manager.user(name)
    puts "What kind of game do you want to play?"
    choice = gets.chomp
    if choice.to_i == 1
      game
    else
      puts "comming soon"
    end
  end

end

user =Ui.new
user.run