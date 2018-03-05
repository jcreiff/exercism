class Diamond
  attr_reader :middle_letter, :middle_row, :width

  def initialize(middle_letter)
    @middle_letter = middle_letter
    @middle_row = make_row(middle_letter)
    @width = middle_row.length
  end

  def make_diamond(top = [])
    return "A\n" if middle_letter == 'A'
    ('A'...middle_letter).each do |letter|
      inside = make_row(letter)
      outer = ' ' * ((width - inside.length) / 2)
      top << outer + inside + outer
    end
    top.join("\n") + "\n#{middle_row}\n" + top.reverse.join("\n") + "\n"
  end

  def make_row(letter)
    return letter if letter == 'A'
    inner_space = (LETTERS.index(letter) * 2) - 1
    letter + (' ' * inner_space) + letter
  end

  LETTERS = ('A'..'Z').to_a

  def self.make_diamond(letter)
    Diamond.new(letter).make_diamond
  end
end

module Bookkeeping
  VERSION = 1
end
