class Manager

  def initialize
    @score = Score.new
  end

  def tally(guess,actual)
    points = 2 if guess == actual
    points = 1 if guess > actual
    points = 0 if guess < actual
    @score.add_the_points(guess,actual,points)
    guess <=> actual

  end

  def board
    puts @score
  end

  def user(name)    
    @score.name = name
    puts "Hello #{name}" 
  end



end