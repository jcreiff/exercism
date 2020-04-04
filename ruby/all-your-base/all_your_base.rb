class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError unless digits.all? { (0...input_base).cover?(_1) }
    raise ArgumentError if input_base < 2 || output_base < 2
    value = find_value(input_base, digits.reverse)
    new_digits(value, output_base)
  end

  def self.find_value(input_base, digits)
    digits.map.with_index { _1 * (input_base**_2) }.sum
  end

  def self.new_digits(value, output_base, digits = [])
    return digits.unshift(value) if value < output_base
    value, digit = value.divmod(output_base)
    new_digits(value, output_base, digits.unshift(digit))
  end
end
