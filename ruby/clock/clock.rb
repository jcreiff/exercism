module ClockNumbers
  refine Fixnum do
    def to_s
      sprintf('%02d', self)
    end
  end
end

class Clock
  attr_reader :minutes, :hours

  def initialize(hours, minutes)
    @rollover, @minutes = format_minutes(minutes)
    @hours = format_hours(hours)
  end

  def +(other)
    initialize(hours, minutes + other)
    self.dup
  end

  def ==(other)
    other.is_a?(Clock) && to_s == other.to_s
  end

  def self.at(hours, minutes)
    Clock.new(hours, minutes)
  end

  using ClockNumbers
  def to_s
    hours.to_s + ':' + minutes.to_s
  end

  private

  def format_minutes(digits)
    digits.divmod(60)
  end

  def format_hours(digits)
    (digits + @rollover) % 24
  end
end

module BookKeeping
  VERSION = 2
end
