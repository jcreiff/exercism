class PigLatin
  REGEX = /^(s?qu|^y(?!t)|(?!xr)^[^aeiouy]+)/

  def self.translate(input)
    input.split.map { _1.sub(REGEX, '') << ($1 || '') << 'ay' }.join(' ')
  end
end
