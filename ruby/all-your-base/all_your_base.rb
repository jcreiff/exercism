class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError, 'Invalid Input' if digits.any? { |digit| digit < 0 || digit >= input_base }
    raise ArgumentError, 'Invalid Input' if [input_base, output_base].any? { |base| base < 2 }
    return digits if digits.empty?
    return [0] if input_base == 10 && digits.all?(&:zero?)
    value = find_value(input_base, digits)
    factors = find_factors(output_base, value)
    new_digits(value, factors)
  end

  def self.find_value(input_base, digits)
    digits.reverse.map.with_index { |num, i| num * (input_base**i) }.reduce(:+)
  end

  def self.find_factors(output_base, value, factors = [], power = 0)
    until output_base**power > value
      factors << output_base**power
      power += 1
    end
    factors
  end

  def self.new_digits(value, factors, new_digits = [])
    factors.reverse.each do |factor|
      new_digits << value / factor
      value = value % factor
    end
    new_digits
  end
end

module BookKeeping
  VERSION = 2
end
