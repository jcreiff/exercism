class PerfectNumber
  CATEGORIES = { -1 => 'abundant', 0 => 'perfect', 1 => 'deficient' }.freeze

  def self.classify(num)
    raise 'Number must be positive' if num.negative?
    CATEGORIES[num <=> (1...num).select { (num % _1).zero? }.sum]
  end
end

module BookKeeping
  VERSION = 1
end
