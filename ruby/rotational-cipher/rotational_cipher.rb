class RotationalCipher
  CAPITAL = ('A'..'Z').to_a
  LOWERCASE = ('a'..'z').to_a

  def self.rotate(phrase, distance)
    phrase.chars.map { |letter| translate(letter, distance) }.join
  end

  def self.translate(letter, distance)
    return letter unless letter =~ /[a-zA-Z]/
    set = letter =~ /[A-Z]/ ? CAPITAL : LOWERCASE
    set.dup.rotate(distance)[set.index(letter)]
  end
end

module BookKeeping
  VERSION = 1
end
