class PigLatin
  def self.translate(input)
    input.split.map { |word| modify(word) }.join(' ')
  end

  def self.modify(word, displaced = '')
    displaced += word.slice!(0) until end_of_sound?(word, displaced) || word.length == 1
    word + displaced + 'ay'
  end

  def self.end_of_sound?(word, displaced)
    ('aeiou'.include?(word[0]) && [word[0], displaced[-1]] != %w[u q]) || %w[yt xr].include?(word[0..1])
  end
end

module BookKeeping
  VERSION = 2
end
