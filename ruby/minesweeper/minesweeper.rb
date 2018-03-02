class Board
  attr_reader :rows

  def initialize(rows)
    @rows = rows
  end

  def transform
    check_for_errors
    rows.map.with_index do |row, x|
      row.chars.map.with_index do |cell, y|
        cell =~ /[\|\+\-\*]/ ? cell : check_cell(cell, x, y)
      end.join
    end
  end

  def self.transform(rows)
    Board.new(rows).transform
  end

  private

  def check_cell(cell, x, y)
    mines = neighbors(x, y).count { |n| rows[n[0]][n[1]] == '*' }
    mines.zero? ? cell : mines
  end

  def neighbors(x, y)
    (0..2).to_a.flat_map do |n|
      [[x, x + 1, x - 1], [y, y + 1, y - 1].rotate(n)].transpose
    end
  end

  def check_for_errors
    raise ArgumentError, 'Invalid Board' unless rows.map(&:size).uniq.count == 1
    raise ArgumentError, 'Invalid Border' unless rows[1..-2].all? { |row| row =~ /\A\|.+\|\z/ }
    raise ArgumentError, 'Invalid Character' if rows.join =~ /[^\|\+\-\*\s]/
  end
end
