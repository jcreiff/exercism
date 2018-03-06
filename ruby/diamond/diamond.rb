class Diamond
  def initialize(letter)
    @letter = letter
    @middle = row(letter)
  end

  def make_diamond
    @middle == 'A' ? "A\n" : mirror(half, [@middle]).join("\n") + "\n"
  end

  def self.make_diamond(letter)
    Diamond.new(letter).make_diamond
  end

  private

  def row(letter)
    letter == 'A' ? 'A' : mirror(letter, (' ' * (ALPHA.index(letter) * 2 - 1)))
  end

  def mirror(object, spacer)
    object + spacer + object.reverse
  end

  def half
    ('A'...@letter).map { |letter| row(letter).center(@middle.size) }
  end

  ALPHA = ('A'..'Z').to_a
end

module Bookkeeping
  VERSION = 1
end
