require 'forwardable'
class Game
  attr_reader :frames
  attr_accessor :current

  def initialize
    @frames = {}
    @current = 1
  end

  def roll(pins)
    self.current += 1 if this_frame.complete?
    check_roll_exceptions(pins)
    this_frame << pins
  end

  def score
    raise BowlingError unless frames[10] && frames.all? { _2.complete? }
    frames.sum { score_frame(_1, _2) }
  end

  private

  def check_roll_exceptions(pins)
    raise BowlingError if !(0..10).cover?(pins) || current > 10
    if this_frame.is_a?(TenthFrame)
      raise BowlingError if this_frame.sum + pins > 20 && this_frame.pins != [10, 10]
    else
      raise BowlingError if this_frame.sum + pins > 10
    end
  end

  def this_frame
    frames[current] ||= (current < 10 ? Frame.new : TenthFrame.new)
  end

  def score_frame(n, frame)
    return frame.score if n == 10
    frame.spare? ? score_spare(n) : frame.strike? ? score_strike(n) : frame.sum
  end

  def score_spare(n)
    10 + frames[n + 1].first
  end

  def score_strike(n)
    frames[n + 1].strike? ? 20 + frames[n + 2].first : 10 + frames[n + 1].sum
  end

  class BowlingError < StandardError
  end
end

class Frame
  extend Forwardable
  attr_reader :pins
  def initialize
    @pins = []
  end

  def_delegators :@pins, :empty?, :<<, :sum, :first, :size

  def strike?
    pins == [10]
  end

  def spare?
    size == 2 && sum == 10
  end

  def complete?
    strike? || size == 2
  end
end

class TenthFrame < Frame
  attr_reader :bonus
  def initialize
    @bonus = []
    super
  end

  def complete?
    first == 10 || spare? ? !bonus.empty? : super
  end

  def <<(pin)
    size == 2 ? bonus << pin : super
  end

  def score
    (pins + bonus).sum
  end
end
