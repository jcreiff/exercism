module ClockNumbers
  refine Fixnum do
    def to_s
      format('%02d', self)
    end
  end
end

class Clock
  attr_accessor :minutes

  def initialize(hours, minutes)
    @minutes = minutes + hours * 60
  end

  def +(other)
    self.minutes += other
    dup
  end

  def ==(other)
    other.is_a?(Clock) && to_s == other.to_s
  end

  def self.at(hours, minutes)
    Clock.new(hours, minutes)
  end

  using ClockNumbers
  def to_s
    (minutes / 60 % 24).to_s + ':' + (minutes % 60).to_s
  end
end

module BookKeeping
  VERSION = 2
end
