class ComplexNumber
  attr_reader :a, :b

  def initialize(a, b)
    @a = a
    @b = b
  end

  alias real a
  alias imaginary b

  def *(other)
    ComplexNumber.new(a * other.a - b * other.b, b * other.a + a * other.b)
  end

  def /(other)
    ComplexNumber.new((a * other.a + b * other.b) / other.sum_of_squares.to_f,
                      (b * other.a - a * other.b) / other.sum_of_squares.to_f)
  end

  %i[+ -].each do |symbol|
    define_method(symbol) do |other|
      ComplexNumber.new(a.send(symbol, other.a), b.send(symbol, other.b))
    end
  end

  def abs
    Math.sqrt(sum_of_squares)
  end

  def conjugate
    ComplexNumber.new(a, -b)
  end

  def exp
    ComplexNumber.new(Math.exp(a) * (Math.cos(b) + Math.sin(b)).round, 0)
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
