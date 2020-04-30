class Darts
  def initialize(x, y)
    @x = x
    @y = y
  end

  def score
    case @x**2 + @y**2
    when 0..1 then 10
    when 1..25 then 5
    when 25..100 then 1
    else 0
    end
  end
end
