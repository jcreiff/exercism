class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError, 'Invalid Input' unless digits.all? { |digit| (0...input_base).cover?(digit) }
    raise ArgumentError, 'Invalid Input' if input_base < 2 || output_base < 2
    return digits if digits.empty?
    return [0] if digits.all?(&:zero?)
    value = find_value(input_base, digits.reverse)
    factors = find_factors(output_base, value)
    new_digits(value, factors)
  end

  def self.find_value(input_base, digits)
    (0...digits.size).map { |i| digits[i] * (input_base**i) }.sum
  end

  def self.find_factors(output_base, value, power = 0, factors = [])
    until output_base**power > value
      factors << output_base**power
      power += 1
    end
    factors
  end

  def self.new_digits(value, factors)
    factors.reverse.map do |factor|
      digit, value = value.divmod(factor)
      digit
    end
  end
end

module BookKeeping
  VERSION = 2
end
