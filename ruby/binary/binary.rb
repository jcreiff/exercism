class Binary
  def self.to_decimal(binary_string)
    raise ArgumentError, 'Invalid binary string' if binary_string =~ /[^01]/
    digits = binary_string.chars.reverse.map(&:to_i)
    (0...digits.length).map { |i| digits[i].zero? ? 0 : 2**i }.reduce(:+)
  end
end

module BookKeeping
  VERSION = 3
end
