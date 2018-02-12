class Robot
  ALPHA = ('A'..'Z').to_a.repeated_permutation(2)
  NUMERIC = (0..9).to_a.repeated_permutation(3)

  @@names = ALPHA.flat_map { |alpha| NUMERIC.map { |num| [alpha, num].join } }

  attr_reader :name

  def initialize
    @name = @@names[@@next_name]
    @@next_name += 1
  end

  def self.forget
    @@next_name = 0
  end

  def reset
    initialize
  end
end

module BookKeeping
  VERSION = 3
end
