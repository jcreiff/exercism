class Isogram
  def self.isogram?(phrase)
    phrase.downcase!
    phrase.scan(/[a-z]/).all? { |letter| phrase.count(letter) == 1 }
  end
end

module BookKeeping
  VERSION = 4
end
