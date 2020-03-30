class RailFenceCipher
  def initialize(phrase, rails)
    @phrase = phrase.chars
    @pattern = (0..rails - 1).to_a + (1..rails - 2).to_a.reverse
  end

  def encode
    @phrase.each_slice(@pattern.length)
           .flat_map { _1.zip(@pattern) }
           .group_by { _1[1] }
           .flat_map { |_k, v| v.map { _1[0] } }
           .join
  end

  def decode
    (0...@phrase.length).each_slice(@pattern.length)
                        .flat_map { _1.zip(@pattern) }
                        .group_by { _1[1] }
                        .flat_map { _2 }
                        .zip(@phrase)
                        .sort_by { _1[0] }
                        .map { _2 }
                        .join
  end

  def self.encode(phrase, rails)
    new(phrase, rails).encode
  end

  def self.decode(phrase, rails)
    new(phrase, rails).decode
  end
end
