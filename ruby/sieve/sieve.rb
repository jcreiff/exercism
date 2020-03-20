class Sieve
  def initialize(max)
    @range = (2..max).to_a
  end

  def primes
    @range.each { |n1| @range.reject! { |n2| n2 != n1 && (n2 % n1).zero? } }
  end
end
