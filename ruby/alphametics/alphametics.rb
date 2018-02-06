class Alphametics
  attr_reader :letters, :words, :leading_digits, :ones, :carryover

  def initialize(puzzle)
    @words = puzzle.scan(/\b\w+\b/)
    @letters = puzzle.scan(/\w/).uniq.sort
    @leading_digits = get_indexes(0)
    @ones = get_indexes(-1)
    @carryover = words[0..-2].all? { |word| word.length < words.last.length }
  end

  def solve
    to_h(options.reject { |set| leading_zero?(set) }
                .select { |set| valid_ones?(set) }
                .find { |set| solution?(set) })
  end

  def self.solve(puzzle)
    Alphametics.new(puzzle).solve
  end

  private

  def get_indexes(i)
    words.map { |word| word[i] }.map { |letter| letters.index(letter) }
  end

  def to_h(values)
    return {} if values.nil?
    letters.zip(values).to_h
  end

  def options
    carryover ? all_combos.select { |set| valid_carryover?(set) } : all_combos
  end

  def all_combos
    (0..9).to_a.permutation(letters.count)
  end

  def valid_carryover?(set)
    set[leading_digits.last] == 1
  end

  def leading_zero?(set)
    leading_digits.any? { |index| set[index].zero? }
  end

  def valid_ones?(set)
    ones[0..-2].map { |index| set[index] }.reduce(:+) % 10 == set[ones.last]
  end

  def solution?(values)
    digits = create_digits(values)
    digits[0..-2].reduce(:+) == digits.last
  end

  def create_digits(set)
    words.map { |word| transform(word, set) }
  end

  def transform(word, set)
    word.chars.map { |letter| set[letters.index(letter)] }.join.to_i
  end
end

module BookKeeping
  VERSION = 4
end
