module RailFenceArray
  refine Array do
    def translate(other)
      map { |i| other[i] }.join
    end
  end
end

class RailFenceCipher
  def self.encode(phrase, rails)
    return phrase if invalid?(phrase, rails)
    send("encode_#{rails}", phrase.chars, (0...phrase.length))
  end

  def self.decode(phrase, rails)
    return phrase if invalid?(phrase, rails)
    send("decode_#{rails}", phrase.chars)
  end

  class << self
    private

    def invalid?(phrase, rails)
      phrase == '' || rails > phrase.length || rails == 1
    end

    def decode_2(chars)
      middle = (chars.length / 2.0).ceil
      chars[0, middle].zip(chars[middle..-1]).join
    end

    def decode_3(chars)
      top, middle, bottom = find_rails(chars, chars.length)
      reconstruct(top, middle, bottom)
    end

    def find_rails(chars, size)
      first = (size / 4.0).ceil
      second = size / 2
      third = size.even? ? size / 4 : first
      [chars[0, first], chars[first, second], chars[-third..-1]]
    end

    def reconstruct(top, middle, bottom, i = 0, output = '')
      segment = [top[i], bottom[i]].zip([middle[i * 2], middle[i * 2 + 1]])
      output << segment.join
      return output if segment.flatten.compact.length < 4
      reconstruct(top, middle, bottom, i + 1, output)
    end

    using RailFenceArray
    def encode_2(phrase, range)
      range.partition(&:even?).flatten.translate(phrase)
    end

    def encode_3(phrase, range)
      outer, second = range.partition(&:even?)
      first, third = outer.partition { |i| (i / 2).even? }
      [first, second, third].flatten.translate(phrase)
    end

    def encode_4(phrase, range)
      first, third = range.select(&:even?).partition { |i| (i % 3).zero? }
      fourth, second = range.select(&:odd?).partition { |i| (i % 3).zero? }
      [first, second, third, fourth].flatten.translate(phrase)
    end
  end

  VERSION = 1
end
