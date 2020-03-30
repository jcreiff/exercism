class Queens
  attr_reader :white, :black

  def initialize(white: [], black: [])
    [white, black].each do |position|
      raise ArgumentError, 'Invalid position' unless valid?(position)
    end
    @white = white
    @black = black
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  private

  def valid?(square)
    square.all? { (0..7).cover?(_1) }
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
