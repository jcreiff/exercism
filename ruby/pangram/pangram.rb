require 'set'

class Pangram

  def self.pangram?(phrase)
    phrase.downcase.chars.select{|char| ALPHA.include?(char)}.to_set == ALPHA
  end

  ALPHA=("a".."z").to_set
end

module BookKeeping
  VERSION = 6
end
