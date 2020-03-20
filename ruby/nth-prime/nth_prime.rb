class Prime
  def initialize
    @primes = [2, 3]
  end

  def nth(n)
    raise ArgumentError, 'Invalid input' if n < 1
    next_num = @primes[-1] + 2
    while @primes.length < n
      @primes << next_num if prime?(next_num)
      next_num += 2
    end
    @primes[n - 1]
  end

  def self.nth(n)
    new.nth(n)
  end

  private

  def prime?(num)
    @primes.all? do
      return true if _1 > Math.sqrt(num)
      num % _1 != 0
    end
  end
end
