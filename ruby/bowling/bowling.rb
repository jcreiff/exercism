class Game
  attr_reader :frames
  attr_accessor :frame_count

  def initialize
    @frames = Hash.new([])
    @frame_count = 1
  end

  def roll(pins)
    check_roll_exceptions(pins)
    update_frame(pins)
    update_frame_count
  end

  def score
    check_score_exceptions
    frames.map { |frame, pins| calculate_frame(frame, pins) }.reduce(:+)
  end

  private

  def check_roll_exceptions(pins)
    raise Game::BowlingError unless (0..10).cover?(pins)
    raise Game::BowlingError if frame_count > 10 && frames[10].reduce(:+) < 10
    return if this_frame.empty?
    raise Game::BowlingError if this_frame[0] + pins > 10
  end

  def this_frame
    frames[frame_count]
  end

  def update_frame(pins)
    if this_frame.empty?
      frames[frame_count] = [pins]
    else
      frames[frame_count] << pins
    end
  end

  def update_frame_count
    self.frame_count += 1 if this_frame == [10] || this_frame.size == 2
  end

  def check_score_exceptions
    raise Game::BowlingError if frame_count < 10
    raise Game::BowlingError if strike?(frames[10]) && frames[11].empty?
    raise Game::BowlingError if strike?(frames[10]) && strike?(frames[11]) && frames[12].empty?
    raise Game::BowlingError if spare?(frames[10]) && frames[11].empty?
  end

  def calculate_frame(frame, pins)
    return score_spare(frame) if spare?(pins) && frame < 10
    return score_strike(frame) if strike?(pins) && frame < 10
    pins.reduce(:+)
  end

  def spare?(pins)
    pins.length == 2 && pins.reduce(:+) == 10
  end

  def score_spare(frame)
    10 + frames[frame + 1].first
  end

  def strike?(pins)
    pins == [10]
  end

  def score_strike(frame)
    strike?(frames[frame + 1]) ? 20 + frames[frame + 2].first : 10 + frames[frame + 1].reduce(:+)
  end

  class BowlingError < StandardError
  end
end

module BookKeeping
  VERSION = 3
end
