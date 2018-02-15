class Atbash
  def self.encode(text)
    text.downcase.scan(/[a-z0-9]/).map { |char| translate(char) }
        .each_slice(5).map(&:join).join(' ')
  end

  def self.translate(char)
    ALPHA.include?(char) ? ALPHA.reverse[ALPHA.index(char)] : char
  end

  ALPHA = ('a'..'z').to_a
end
