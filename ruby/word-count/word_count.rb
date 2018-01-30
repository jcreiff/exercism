class Phrase
  attr_reader :phrase, :words

  def initialize(phrase)
    @phrase = sanitize(phrase)
  end

  def word_count
    phrase.each_with_object({}) do |word, counts|
      counts[word] = phrase.count(word)
    end
  end

  def sanitize(phrase)
    phrase.downcase.scan(/\b[\w']+\b/)
  end
end

module BookKeeping
  VERSION = 1
end
