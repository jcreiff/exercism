class OcrNumbers
  REGEX = /\n\s+\n/
  DIGITS = ['_ | ||_|', '|  |', '_  _||_', '_  _| _|', '|_|  |', '_ |_  _|',
            '_ |_ |_|', '_   |  |', '_ |_||_|', '_ |_| _|'].freeze

  def initialize(text, valid = false)
    @text = text
    @rows = text.split("\n")
    @multiline = text =~ REGEX
    @valid = valid || check_validity
  end

  def convert
    return convert_multiline if @multiline
    @rows.map { _1.scan(/.{3}/) }.transpose
         .map { DIGITS.index(_1.join.strip) || '?' }.join
  end

  def self.convert(text)
    OcrNumbers.new(text).convert
  end

  private

  def check_validity
    raise ArgumentError unless @rows.length == 4 || @multiline
    raise ArgumentError if @rows.any? { |row| row.length % 3 != 0 }
  end

  def convert_multiline
    @text.split(REGEX).map { |set| OcrNumbers.new(set, true).convert }.join(',')
  end
end
