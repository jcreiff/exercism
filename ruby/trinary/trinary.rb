class Trinary
  def initialize(digits)
    @digits = validate(digits)
  end

  def to_decimal
    (0...@digits.length).reduce(0) { |sum, n| sum + @digits[n] * 3**n }
  end

  private

  def validate(original)
    original =~ /[^012]/ ? [0] : original.chars.map(&:to_i).reverse
  end
end

module BookKeeping
  VERSION = 1
end
