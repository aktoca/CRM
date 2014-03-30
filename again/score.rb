class Score
  attr_accessor :name, :result, :points, :total_points

  def initialize
    @@points = 0
    @guess = 0
    @actual =0
    @total_points = 0
  end
  
  def add_the_points(guess,actual,points)
    @guess = guess
    @actual = actual
    @@points += points
  end

  def finalize
    @@total_points = @@points
    @@points = 0
    puts score_board
  end



  def turn_points
    "Your guess: #{@guess}\nAcutal Number: #{@actual}\n#{@@points}"
  end

  def score_board
    puts "#{name}\nPoints: #{@@total_points}\n"
  end


  
end