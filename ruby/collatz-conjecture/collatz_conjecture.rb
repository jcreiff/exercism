class CollatzConjecture
  def self.steps(n, step_count = 0)
    raise ArgumentError if n < 1
    return step_count if n == 1
    n.even? ? steps(n / 2, step_count + 1) : steps(n * 3 + 1, step_count + 1)
  end
end

module BookKeeping
  VERSION = 1
end
