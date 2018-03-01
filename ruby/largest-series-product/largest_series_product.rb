class Series
  def initialize(digits)
    @invalid = digits.match(/\D/)
    @digits = digits.scan(/\d/).map(&:to_i)
  end

  def largest_product(range)
    return 1 if range.zero?
    check_exceptions(range)
    @digits.each_cons(range)
           .map { |numbers| numbers.reduce(:*) }
           .reduce { |memo, product| memo > product ? memo : product }
  end

  def check_exceptions(range)
    raise ArgumentError, 'Invalid Series' if @invalid
    raise ArgumentError, 'Invalid Range' unless @digits[range - 1] && range > 0
  end
end

module BookKeeping
  VERSION = 3
end
