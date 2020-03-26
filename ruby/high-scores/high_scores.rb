require 'forwardable'
class HighScores
  extend Forwardable
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def_delegator :@scores, :last, :latest
  def_delegator :@scores, :max, :personal_best

  def personal_top_three
    scores.sort { _2 <=> _1 }.take(3)
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end
