class Queens
  attr_reader :white, :black

  def initialize(white: [], black: [])
    @white = check_position(white)
    @black = check_position(black)
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  private

  def check_position(squares)
    squares.all? { |square| (0..7).cover?(square) } ? squares : invalid
  end

  def invalid
    raise ArgumentError, 'Invalid position'
  end

  def same_row?
    white.first == black.first
  end

  def same_column?
    white.last == black.last
  end

  def same_diagonal?
    (white.first - black.first).abs == (white.last - black.last).abs
  end
end

module BookKeeping
  VERSION = 2
end
