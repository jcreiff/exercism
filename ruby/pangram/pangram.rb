class Pangram
  def self.pangram?(phrase)
    counts = phrase.downcase.scan(/[a-z]/).tally
    counts.size == 26 && counts.values.all?(&:positive?)
  end
end
