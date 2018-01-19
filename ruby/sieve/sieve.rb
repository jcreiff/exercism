class Sieve
  attr_reader :upper_bound

  def initialize(upper_bound)
    @upper_bound = upper_bound
  end

  def primes(divisor = 2, list = (2..upper_bound).to_a)
    return list if list.empty?
    list.delete_if { |num| (num % divisor).zero? && num != divisor }
    divisor == 2 ? divisor += 1 : divisor += 2
    divisor += 2 until list.include?(divisor) || divisor > (upper_bound / 2)
    divisor > (upper_bound / 2) ? list : primes(divisor, list)
  end
end

module BookKeeping
  VERSION = 1
end
