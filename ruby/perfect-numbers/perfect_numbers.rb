class PerfectNumber
  def self.classify(num)
    raise 'Number must be positive' if num < 1
    CATEGORIES[num <=> (1...num).select { |i| (num % i).zero? }.reduce(:+)]
  end

  CATEGORIES = { -1 => 'abundant', 0 => 'perfect', 1 => 'deficient' }.freeze
end

module BookKeeping
  VERSION = 1
end
