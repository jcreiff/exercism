class Triangle
  attr_reader :height
  attr_accessor :last_row

  def initialize(height)
    @height = height
    @last_row = [1]
  end

  def rows
    1.upto(height).map { |n| next_row(n) }
  end

  def next_row(n)
    return @last_row if n == 1
    @last_row = n.even? ? even_row : odd_row
  end

  def even_row
    half_next_row + half_next_row.reverse
  end

  def odd_row
    half_next_row + [half_last_row[-1] * 2] + half_next_row.reverse
  end

  def half_next_row
    half_last_row.each_cons(2).map { |set| set.reduce(:+) }.flatten.prepend(1)
  end

  def half_last_row
    last_row[0..last_row.size / 2 - (last_row.size.even? ? 1 : 0)]
  end
end
