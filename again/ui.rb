require './manager'
require './score'

class Ui


  def initialize
    
  end


  def user_input
    input = gets.chomp
  end

  def turn
    @manager = Manager.new
    done = false

    while !done        
      puts "\nEnter a number between 1-10:"
      guess = gets.chomp.to_i
      number =  rand(10).to_i
      puts number
      result = @manager.tally(guess,number)
      if result == -1
        puts "fine one point, but that's it"
      elsif result == 0
        puts "how'd you do that?"
      elsif result == 1
        puts "no points for you"
      end
          
      puts "Again? y/n"
      again = user_input
      done = true if again == 'n'
      turn
    end
  end

  def game
    puts "\e[H\e[2J" 
    puts "this is a guessing game"
    puts "if you can guess the number you get two points"
    puts "if you guess under you get one"
    puts "but if you guess over it's Zero, with a capitol ZED"
    puts "do you want to play?"
    puts "Again? y/n"
    round = user_input
    turn if round == 'n'
    puts "let's begin:"
    turn

  end

  def display
    puts "Let's play a game!"
    game



  end
  
  def run
    display
  end

end

user =Ui.new
user.run