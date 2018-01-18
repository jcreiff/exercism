require 'set'

class Pangram

  def self.pangram?(phrase)
    phrase.downcase.split("").select{|char| ALPHA.include?(char)}.sort.to_set == ALPHA
  end

  ALPHA=("a".."z").to_set
end

module BookKeeping
  VERSION = 6
end
