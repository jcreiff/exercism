module SayArray
  refine Array do
    def clear_zeros
      shift until first != 0
      self
    end
  end
end

class Say
  MIN = 0
  MAX = 999_999_999_999
  SINGLE_DIGITS = ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'].freeze
  TEENS = %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen].freeze
  MULTIPLES_OF_TEN = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'].freeze
  SUFFIXES = ['', ' thousand', ' million', ' billion'].freeze

  def initialize(number)
    @number = number
    @in_range = (MIN...MAX).cover?(number)
  end

  def in_english
    raise ArgumentError, 'Number out of range' unless @in_range
    return 'zero' if @number.zero?
    numbers.map.with_index { |set, i| subset(set, i) }.reverse.join(' ').strip
  end

  private

  using SayArray
  def numbers
    @number.digits.each_slice(3).to_a.map(&:reverse).map(&:clear_zeros)
  end

  def subset(digits, i)
    [to_words(digits), digits.empty? ? '' : SUFFIXES[i]].join
  end

  def to_words(digits)
    send("write_#{digits.count}_digit", digits)
  end

  def write_0_digit(_digits) end

  def write_1_digit(digits, i = -1)
    SINGLE_DIGITS[digits[i]]
  end

  def write_2_digit(digits)
    return TEENS[digits.join.to_i - 10] if digits.first == 1
    divider = digits.last.zero? ? '' : '-'
    [MULTIPLES_OF_TEN[digits.first], write_1_digit(digits)].join(divider)
  end

  def write_3_digit(digits)
    [write_1_digit(digits, 0), 'hundred', write_2_digit(digits[1, 2])].join(' ')
  end
end

module BookKeeping
  VERSION = 1
end
