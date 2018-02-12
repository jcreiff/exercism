class NameMaker
  @@all_names = ('AA000'..'ZZ999').to_a
  @@next_name = -1

  def make_name
    @@next_name += 1
    @@all_names[@@next_name]
  end

  def forget
    @@next_name = -1
  end
end

class Robot
  attr_reader :name

  @@generator = NameMaker.new

  def initialize
    @name = @@generator.make_name
  end

  def self.forget
    @@generator.forget
  end

  def reset
    initialize
  end
end

module BookKeeping
  VERSION = 3
end
