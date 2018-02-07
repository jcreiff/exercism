class Acronym
  def self.abbreviate(phrase)
    phrase.scan(/\b\w/).join.upcase
  end
end

module BookKeeping
  VERSION = 4
end
