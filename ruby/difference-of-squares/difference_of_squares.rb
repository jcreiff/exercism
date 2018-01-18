class Squares
  attr_reader :num_range
  
  def initialize(num)
    @num_range=(1..num).to_a
  end

  def square_of_sum
    num_range.reduce(:+) ** 2
  end

  def sum_of_squares
    num_range.map{|i| i**2}.reduce(:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION=4
end
