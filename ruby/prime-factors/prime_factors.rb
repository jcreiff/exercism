class PrimeFactors
  def self.for(number, factors = [])
    return factors if number < 2
    factor = (2..number).find { |divisor| (number % divisor).zero? }
    number /= factor
    self.for(number, factors << factor)
  end
end
