class Manager

  def initialize
    @stuff = []
  end

  def create_user(name)
    @score = Score.new
    @score.name = name
    @stuff << @score
  end


  def tally(guess,actual)
    if guess == actual
      points = 2 
    elsif (guess <= actual + 2) && (guess >= actual -2)
      points = 1 
    else
      points = 0
    end
    @score.add_the_points(guess,actual,points)
    points
  end

  def change_points(new)
    @score.total_points = new

  end

  def finalize
    @stuff << @score.points
    @score.finalize

  end

  def display_name
    puts @score.name
  end

  def score_board
    puts @score.score_board
    puts @stuff.
  end



end