class Isogram
  def self.isogram?(phrase)
    letters = phrase.downcase.scan(/[a-z]/)
    letters.uniq == letters
  end
end

module BookKeeping
  VERSION = 4
end
