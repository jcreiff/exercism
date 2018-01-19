class Bob
  attr_reader :remark

  def initialize(remark)
    @remark = remark.strip
  end

  def analyze
    return 'Whoa, chill out!' if shouting?
    return 'Sure.' if question?
    return 'Fine. Be that way!' if silence?
    'Whatever.'
  end

  def self.hey(remark)
    Bob.new(remark).analyze
  end

  private

  def shouting?
    letters = remark.gsub(/[^A-Za-z]/, '')
    !letters.empty? && letters.chars.all? { |char| ('A'..'Z').cover?(char) }
  end

  def question?
    remark[-1] == '?'
  end

  def silence?
    remark.empty?
  end
end

module BookKeeping
  VERSION = 1
end
