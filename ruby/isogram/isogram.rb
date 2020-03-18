class Isogram
  def self.isogram?(phrase)
    phrase.downcase!
    phrase.scan(/[a-z]/).tally.all? { _2 == 1 }
  end
end

module BookKeeping
  VERSION = 4
end
