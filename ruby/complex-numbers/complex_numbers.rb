class ComplexNumber
  attr_reader :a, :b

  def initialize(a, b)
    @a = a
    @b = b
  end

  alias real a
  alias imaginary b

  %i[+ - * / conjugate exp].each do |symbol|
    define_method(symbol) do |other = self|
      ComplexNumber.new(*operations(other)[symbol])
    end
  end

  def operations(other)
    { :+ => [a + other.a, b + other.b],
      :- => [a - other.a, b - other.b],
      :* => [a * other.a - b * other.b, b * other.a + a * other.b],
      :/ => [(a * other.a + b * other.b) / other.sum_of_squares.to_f,
             (b * other.a - a * other.b) / other.sum_of_squares.to_f],
      :conjugate => [a, -b],
      :exp => [Math.exp(a) * (Math.cos(b) + Math.sin(b)).round, 0] }
  end

  def abs
    Math.sqrt(sum_of_squares)
  end

  def ==(other)
    a == other.a && b == other.b
  end

  def sum_of_squares
    a**2 + b**2
  end
end

module BookKeeping
  VERSION = 1
end
