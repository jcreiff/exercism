class Anagram
  def initialize(word)
    @original_word = word.downcase
    @original_letters = sorted_letters(@original_word)
  end

  def match(words)
    words.select { |word| anagram?(word.downcase) }
  end

  private

  def anagram?(word)
    @original_letters == sorted_letters(word) && @original_word != word
  end

  def sorted_letters(word)
    word.chars.sort
  end
end

module BookKeeping
  VERSION = 2
end
