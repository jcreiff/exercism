class Squares
  attr_reader :num_range

  def initialize(num)
    @num_range = (1..num)
  end

  def square_of_sum
    num_range.sum**2
  end

  def sum_of_squares
    num_range.sum { |i| i**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 4
end
