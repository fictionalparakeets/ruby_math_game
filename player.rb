class Player
  attr_accessor :name, :score, :wrong_answers

  def initialize(name)
    @name = name
    @score = 0
  end

  def add_point
    @score += 1
  end

end
