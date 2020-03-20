class SumOfMultiples
  def initialize(*factors)
    @factors = factors.reject(&:zero?)
  end

  def to(max)
    (0...max).filter { multiple?(_1) }.sum
  end

  private

  def multiple?(num)
    @factors.find { (num % _1).zero? }
  end
end
