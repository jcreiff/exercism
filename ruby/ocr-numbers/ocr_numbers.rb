class OcrNumber
  def initialize(text)
    @text = text[0..2].map(&:strip)
  end

  def translate
    TEXT_LINES.include?(@text) ? TEXT_LINES.index(@text) : '?'
  end

  TEXT_LINES = [['_', '| |', '|_|'], ['', '|', '|'], ['_', '_|', '|_'],
                ['_', '_|', '_|'], ['', '|_|', '|'], ['_', '|_', '_|'],
                ['_', '|_', '|_|'], ['_', '|', '|'], ['_', '|_|', '|_|'],
                ['_', '|_|', '_|']].freeze
end

class OcrNumbers
  REGEX = /\n\s+\n/

  def initialize(text, second = false)
    @text = text
    @rows = text.split("\n")
    @multiline = text =~ REGEX
    @second = second
  end

  def convert
    return convert_multiline if @multiline
    raise ArgumentError unless @rows.length == 4 || @second
    raise ArgumentError if @rows.any? { |row| row.length % 3 != 0 }
    @rows.map { |row| row.scan(/.{3}/) }
         .transpose
         .map { |number| OcrNumber.new(number).translate }
         .join
  end

  def convert_multiline
    @text.split(REGEX).map { |set| OcrNumbers.new(set, true).convert }.join(',')
  end

  def self.convert(text)
    OcrNumbers.new(text).convert
  end
end

module BookKeeping
  VERSION = 1
end
