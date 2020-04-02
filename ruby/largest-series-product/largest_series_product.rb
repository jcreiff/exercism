class Series
  def initialize(digits)
    @digits = digits.scan(/\d/).map(&:to_i)
    @invalid = digits.match(/\D/)
  end

  def largest_product(range)
    return 1 if range.zero?
    check_exceptions(range)
    @digits.each_cons(range).map { _1.reduce(:*) }.max
  end

  def check_exceptions(range)
    raise ArgumentError if @invalid || range > @digits.size
  end
end
