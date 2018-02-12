class NameMaker
  @@all_names = ('AA000'..'ZZ999').to_a

  def make_name(i)
    @@all_names[i]
  end
end

class Robot
  attr_reader :name

  @@generator = NameMaker.new
  @@robot_count = 0

  def initialize
    @name = @@generator.make_name(@@robot_count)
    @@robot_count += 1
  end

  def self.forget
    @@robot_count = 0
  end

  def reset
    initialize
  end
end

module BookKeeping
  VERSION = 3
end
