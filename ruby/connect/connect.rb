class Board
  attr_reader :game, :x_set, :o_set, :winner

  def initialize(game)
    @game = game.map { |row| row.split(' ') }
    @o_set = find_indexes(@game, 'O')
    @x_set = find_indexes(@game.transpose, 'X')
    @winner = check_for_winners
  end

  def check_for_winners
    winner?(o_set) ? 'O' : winner?(x_set) ? 'X' : ''
  end

  def find_indexes(board, player)
    board.map { |row| row.map.with_index { |char, index| index if char == player }.compact }
  end

  def winner?(board)
    board.first.each do |start|
      result = check_board(board, 0, start, [])
      return true if result
    end
    false
  end

  def check_board(board, row, col, previous, validated = false)
    return true if row == board.length - 1
    valid_moves = [[row + 1, col], [row + 1, col - 1], [row, col + 1],
                   [row, col - 1], [row - 1, col], [row - 1, col + 1]]
    valid_moves.each do |next_row, next_col|
      if board[next_row].include?(next_col) && !(previous.include?([next_row, next_col]))
        previous << [row, col]
        row = next_row
        col = next_col
        validated = true
        break
      end
    end
    validated ? check_board(board, row, col, previous) : false
  end
end

module BookKeeping
  VERSION = 2
end
