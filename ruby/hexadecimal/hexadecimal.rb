module HexString
  refine String do
    def to_hex
      self =~ /[a-f]/ ? %w[a b c d e f].index(self) + 10 : to_i
    end
  end
end

class Hexadecimal
  def initialize(input)
    @input = input.reverse
  end

  using HexString
  def to_decimal
    return 0 if @input =~ /[^a-f0-9]/
    (0...@input.length).sum { |i| @input[i].to_hex * (16**i) }
  end
end
