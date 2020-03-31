class Triangle
  def initialize(sides)
    @sides = sides.sort
    @valid = @sides[0..1].sum > @sides.last
    @lengths = sides.uniq.count
  end

  [['equilateral?', :==, 1],
   ['isosceles?', :<=, 2],
   ['scalene?', :==, 3]].each do |name, operator, number|
    define_method(name.to_sym) { @valid && @lengths.send(operator, number) }
  end
end
