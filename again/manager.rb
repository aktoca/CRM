class Manager

  def initialize
    points = []
    @score = Score.new
  end

  def tally(guess,actual)
    puts "your guess is #{guess}"
    puts "the actual was #{actual}"
    puts "you get"
    guess <=> actual

  end



end