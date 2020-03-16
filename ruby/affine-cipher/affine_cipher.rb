class Affine
  attr_reader :a, :b, :mmi
  ALPHA = ('a'..'z').to_a

  def initialize(a, b)
    raise ArgumentError if a.gcd(26) != 1
    @a = a
    @b = b
    @mmi = (1..26).find { |i| i * a % 26 == 1 }
  end

  def encode(text)
    chars = sanitize(text)
    encoded = chars.map { |c| index(c) ? ALPHA[(a * index(c) + b) % 26] : c }
    encoded.each_slice(5).map(&:join).join(' ')
  end

  def decode(text)
    chars = sanitize(text)
    chars.map { |c| index(c) ? ALPHA[mmi * (index(c) - b) % 26] : c }.join
  end

  def sanitize(text)
    text.downcase.scan(/[a-z0-9]/)
  end

  def index(char)
    ALPHA.index(char)
  end
end
