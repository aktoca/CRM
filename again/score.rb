class Score
  attr_accessor :name, :guess, :actual, :result, :points

  def initialize
    @points = 0
    @guess = 0
    @actual =0
  end
  
  def add_the_points(guess,actual,points)
    @guess = guess
    @actual = actual
    @points += points
  end



  def to_s
    "Your guess: #{@guess}\nAcutal Number: #{@actual}\nPoints: #{@points}\nname:#{@name}"
  end

  
end