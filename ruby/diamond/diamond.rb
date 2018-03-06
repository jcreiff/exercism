class Diamond
  attr_reader :middle_letter, :middle_row

  def initialize(middle_letter)
    @middle_letter = middle_letter
    @middle_row = row(middle_letter)
  end

  def make_diamond
    return "A\n" if middle_letter == 'A'
    [half, middle_row, half.reverse].join("\n") + "\n"
  end

  def self.make_diamond(letter)
    Diamond.new(letter).make_diamond
  end

  private

  def half
    ('A'...middle_letter).map { |letter| row(letter).center(@middle_row.size) }
  end

  def row(letter)
    return letter if letter == 'A'
    letter + (' ' * (ALPHA.index(letter) * 2 - 1)) + letter
  end

  ALPHA = ('A'..'Z').to_a
end

module Bookkeeping
  VERSION = 1
end
