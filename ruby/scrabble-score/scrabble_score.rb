class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    @word.to_s.upcase.scan(/[A-Z]/).sum(&LETTER_SCORES.method(:[]))
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  LETTER_SCORES = Hash.new(1).merge('D' => 2, 'G' => 2, 'B' => 3, 'C' => 3,
                                    'M' => 3, 'P' => 3, 'F' => 4, 'H' => 4,
                                    'V' => 4, 'W' => 4, 'Y' => 4, 'K' => 5,
                                    'J' => 8, 'X' => 8, 'Q' => 10, 'Z' => 10)
end
