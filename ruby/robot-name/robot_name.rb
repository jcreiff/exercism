class Robot
  attr_reader :name

  @@names = ('AA000'..'ZZ999').to_a

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
