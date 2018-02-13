class Matrix
  attr_reader :rows, :columns

  def initialize(input)
    @rows = input.split("\n").map { |row| row.split(' ').map(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    row_maxes.select { |row, column| rows[row][column] == column_min(column) }
  end

  def row_maxes
    rows.map.with_index { |row, i| [i, row.index(row.max)] }
  end

  def column_min(column)
    columns[column].min
  end
end
