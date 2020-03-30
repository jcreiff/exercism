module SayArray
  refine Array do
    def clear_zeros
      pop until last != 0
      self
    end
  end
end

class Say
  SINGLE_DIGITS = ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven',
                   'eight', 'nine'].freeze
  TEENS = %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen
             eighteen nineteen].freeze
  MULTIPLES_OF_TEN = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty',
                      'seventy', 'eighty', 'ninety'].freeze
  SUFFIXES = ['', 'thousand', 'million', 'billion'].freeze

  def initialize(number)
    @number = number
  end

  def in_english
    raise ArgumentError, 'Out of range' unless (0..999_999_999_999).cover?(@number)
    return 'zero' if @number.zero?
    numbers.map.with_index { subset(_1, _2) }.reverse.join(' ').strip
  end

  private

  using SayArray
  def numbers
    @number.digits.each_slice(3).map { _1.clear_zeros.reverse }
  end

  def subset(digits, power)
    [to_words(digits), digits.empty? ? '' : SUFFIXES[power]].join(' ')
  end

  def to_words(digits)
    send("write_#{digits.count}", digits)
  end

  def write_0(_digits) end

  def write_1(digits, place = -1)
    SINGLE_DIGITS[digits[place]]
  end

  def write_2(digits)
    return TEENS[digits.join.to_i - 10] if digits.first == 1
    divider = digits.last.zero? ? '' : '-'
    [MULTIPLES_OF_TEN[digits.first], write_1(digits)].join(divider)
  end

  def write_3(digits)
    [write_1(digits, 0), 'hundred', write_2(digits[1, 2])].join(' ')
  end
end
