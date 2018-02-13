class FoodChain
  def self.song
    (1..8).to_a.map { |n| verse(n) }.join("\n")
  end

  def self.verse(n)
    lyrics = "I know an old lady who swallowed a #{VARIATIONS[n][0]}" + VARIATIONS[n][1]
    n.downto(1).each { |i| lyrics += VARIATIONS[i][2] } if n < 8
    lyrics
  end

  VARIATIONS = { 1 => ["fly.\n", '',
                       "I don't know why she swallowed the fly. Perhaps she'll die.\n"],
                 2 => ["spider.\n", "It wriggled and jiggled and tickled inside her.\n",
                       "She swallowed the spider to catch the fly.\n"],
                 3 => ["bird.\n", "How absurd to swallow a bird!\n",
                       "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"],
                 4 => ["cat.\n", "Imagine that, to swallow a cat!\n",
                       "She swallowed the cat to catch the bird.\n"],
                 5 => ["dog.\n", "What a hog, to swallow a dog!\n",
                       "She swallowed the dog to catch the cat.\n"],
                 6 => ["goat.\n", "Just opened her throat and swallowed a goat!\n",
                       "She swallowed the goat to catch the dog.\n"],
                 7 => ["cow.\n", "I don't know how she swallowed a cow!\n",
                       "She swallowed the cow to catch the goat.\n"],
                 8 => ["horse.\n", "She's dead, of course!\n"] }.freeze
end

module BookKeeping
  VERSION = 2
end
