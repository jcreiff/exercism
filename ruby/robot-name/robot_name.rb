class Robot
  attr_accessor :name
  ALPHA = ('A'..'Z').to_a
  NUMERIC = (0..9).to_a

  @@names = []

  def initialize
    @name = [ALPHA.sample(2), NUMERIC.sample(3)].join
    @@names.include?(@name) ? reset : @@names.push(@name)
  end

  def self.forget; end

  def reset
    initialize
  end
end

module BookKeeping
  VERSION = 3
end
