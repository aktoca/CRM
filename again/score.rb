class Score
  @@total_points = 0
  attr_accessor :name, :points, :total_points, :games_played

  def initialize
    @points = 0
    @guess = 0
    @actual =0
    @games_played = 0

  end
  
  def add_the_points(guess,actual,points)
    @guess = guess
    @actual = actual
    @points += points
  end

  def finalize
    @games_played += 1
    puts "For this round you got this many points:"
    puts @points
    @@total_points += @points
    @points = 0
    puts  
  end



  def turn_points
    "Your guess: #{@guess}\nAcutal Number: #{@actual}\n#{@@points}"
  end

  def score_board
    puts "#{name}\nNumber of Games Played: #{games_played}\nPoints: #{@@total_points}\n"
  end


  
end