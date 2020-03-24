class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select { same_letters?(_1) && !same_word?(_1) }
  end

  private

  def same_letters?(candidate)
    @word.downcase.chars.tally == candidate.downcase.chars.tally
  end

  def same_word?(candidate)
    @word.casecmp(candidate).zero?
  end
end
