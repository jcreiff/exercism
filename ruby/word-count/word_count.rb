class Phrase
  attr_reader :phrase, :words

  def initialize(phrase)
    @phrase = sanitize(phrase)
    @words = {}
  end

  def word_count
    phrase.each { |word| words[word] = phrase.count(word) }
    words
  end

  def sanitize(phrase)
    separated = phrase.downcase.gsub(/[\W&&[^']]/, ' ').split(' ')
    separated.map { |word| handle_quotes(word) }
  end

  def handle_quotes(word)
    word.start_with?("'") || word.end_with?("'") ? word.gsub!(/[']/, '') : word
  end
end

module BookKeeping
  VERSION = 1
end
