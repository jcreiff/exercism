class Grains
  VALID_NUMBERS = (1..64).freeze
  class<<self
    def square(num)
      raise ArgumentError, 'Invalid number' unless VALID_NUMBERS.include?(num)
      2.pow(num - 1)
    end

    def total
      VALID_NUMBERS.sum { square(_1) }
    end
  end
end
