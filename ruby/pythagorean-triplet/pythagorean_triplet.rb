class Triplet
  attr_reader :sum, :product

  def initialize(a, b, c)
    @digits = [a, b, c]
    @sum = @digits.reduce(:+)
    @product = @digits.reduce(:*)
  end

  def pythagorean?
    @digits[0]**2 + @digits[1]**2 == @digits[2]**2
  end

  def self.where(min_factor: 1, max_factor:, sum: nil)
    combos = [*(min_factor..max_factor)].combination(3)
    triplets = combos.map { |combo| Triplet.new(*combo) }.select(&:pythagorean?)
    sum ? triplets.select { |triplet| triplet.sum == sum } : triplets
  end
end
