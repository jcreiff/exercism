class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = factors
  end

  def to(max)
    return 0 if factors.empty?
    (0...max).select { |i| multiple?(i) }.reduce(:+)
  end

  private

  def multiple?(num)
    factors.any? { |factor| (num % factor).zero? }
  end
end

module BookKeeping
  VERSION = 2
end
