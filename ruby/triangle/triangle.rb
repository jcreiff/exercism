class Triangle
  def initialize(sides)
    @sides = sides.sort
    @valid = @sides[0..1].reduce(:+) > @sides.last
    @lengths = sides.uniq.count
  end

  def equilateral?
    @valid && @lengths == 1
  end

  def isosceles?
    @valid && @lengths <= 2
  end

  def scalene?
    @valid && @lengths == 3
  end
end

module BookKeeping
  VERSION = 1
end
