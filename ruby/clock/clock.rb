class Clock
  attr_accessor :minutes, :hours, :rollover

  def initialize(hours, minutes)
    @rollover, @minutes = format_minutes(minutes)
    @hours = format_hours(hours)
  end

  def to_s
    [hours, minutes].map { |digits| zero_pad(digits) }.join(':')
  end

  def +(other)
    initialize(hours, minutes + other)
    self
  end

  def ==(other)
    to_s == other.to_s
  end

  def self.at(hours, minutes)
    Clock.new(hours, minutes)
  end

  private

  def format_minutes(digits)
    digits.divmod(60)
  end

  def format_hours(digits)
    (digits + rollover) % 24
  end

  def zero_pad(digits)
    digits < 10 ? digits.to_s.prepend('0') : digits
  end
end

module BookKeeping
  VERSION = 2
end
