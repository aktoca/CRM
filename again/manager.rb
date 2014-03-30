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
    puts "Hi #{@score.name}"
    points = 2 if guess == actual
    points = 1 if guess > actual
    points = 0 if guess < actual
    @score.add_the_points(guess,actual,points)
    puts @score.to_s
    guess <=> actual

  end

  def display_name
    puts @score.name
  end

  def board
    puts @score
  end



end