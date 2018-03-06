class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError, 'Invalid Input' unless digits.all? { |digit| (0...input_base).cover?(digit) }
    raise ArgumentError, 'Invalid Input' if input_base < 2 || output_base < 2
    return digits if digits.empty?
    return [0] if digits.all?(&:zero?)
    value = find_value(input_base, digits.reverse)
    new_digits(value, output_base)
  end

  def self.find_value(input_base, digits)
    (0...digits.size).map { |i| digits[i] * (input_base**i) }.sum
  end

  def self.new_digits(value, output_base, digits = [])
    return digits.unshift(value) if value < output_base
    value, digit = value.divmod(output_base)
    new_digits(value, output_base, digits.unshift(digit))
  end
end

module BookKeeping
  VERSION = 2
end
