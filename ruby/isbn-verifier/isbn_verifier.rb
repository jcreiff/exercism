module IsbnString
  refine String do
    def to_i
      self == 'X' ? 10 : super
    end
  end
end

class IsbnVerifier
  using IsbnString
  def self.valid?(n)
    return false unless n.delete('-') =~ /\A\d{9}[\d|X]\z/
    (n.scan(/[\dX]/).map(&:to_i).zip(10.downto(1)).sum { |a, b| a * b } % 11).zero?
  end
end

module BookKeeping
  VERSION = 1
end
