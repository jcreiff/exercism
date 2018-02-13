class Brackets
  def initialize(input)
    @input = input
    @sets = [[%w[[ ]], input.scan(/\[|\]/)], [%w[{ }], input.scan(/{|}/)], [%w[( )], input.scan(/(|)/)]]
  end

  def paired?
    check_counts && check_closures && check_nesting
  end

  def self.paired?(input)
    Brackets.new(input).paired?
  end

  private

  def check_counts
    @sets.all? { |chars, set| chars.map { |char| set.count(char) }.reduce(:-).zero? }
  end

  def check_closures
    @sets.none? { |chars, set| set.first == chars.last || set.last == chars.first }
  end

  def check_nesting
    @input.scan(/\[\}|\[\)|\{\]|\{\)|\(\]|\(\}/).empty?
  end
end

module BookKeeping
  VERSION = 4
end
