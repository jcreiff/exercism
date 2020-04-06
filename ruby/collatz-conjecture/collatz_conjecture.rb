class CollatzConjecture
  def self.steps(n)
    raise ArgumentError if n < 1
    count = 0
    until n == 1
      n.even? ? n /= 2 : n = n * 3 + 1
      count += 1
    end
    count
  end
end
