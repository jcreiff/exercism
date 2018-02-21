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

  def initialize(text, commas = false)
    @text = text
    @rows = text.split("\n")
    @multiline = text =~ REGEX
    @commas = commas
  end

  def convert
    return convert_multiline if @multiline
    check_validity
    @rows.map { |row| row.scan(/.{3}/) }.transpose
         .map { |number| OcrNumber.new(number).translate }.join
  end

  def self.convert(text)
    OcrNumbers.new(text).convert
  end

  private

  def check_validity
    raise ArgumentError unless @rows.length == 4 || @commas
    raise ArgumentError if @rows.any? { |row| row.length % 3 != 0 }
  end

  def convert_multiline
    @text.split(REGEX).map { |set| OcrNumbers.new(set, true).convert }.join(',')
  end
end

module BookKeeping
  VERSION = 1
end
