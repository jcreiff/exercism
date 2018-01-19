class Prime
  attr_reader :num, :primes
  attr_accessor :next_num

  def initialize(num)
    @num = num
    @primes = [2]
    @next_num = 3
  end

  def nth
    raise ArgumentError, 'Invalid input' if num < 1
    add_primes until primes.length == num
    primes.last
  end

  def add_primes
    upper_bound = Math.sqrt(next_num).floor
    primes << next_num unless (2..upper_bound).any? { |n| (next_num % n).zero? }
    self.next_num += 2
  end

  def self.nth(num)
    Prime.new(num).nth
  end
end

module BookKeeping
  VERSION = 1
end
