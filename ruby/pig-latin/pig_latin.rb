class PigLatin
  REGEX = /^s?qu|^y(?!t)|(?!xr)^[^aeiouy]+/

  def self.translate(input)
    input.split.map { |word| piglatinize(word) }.join(' ')
  end

  def self.piglatinize(word)
    displaced = word.match(REGEX)
    word.sub(REGEX, '') + displaced.to_s + 'ay'
  end

  private_class_method :piglatinize
end

module BookKeeping
  VERSION = 2
end
