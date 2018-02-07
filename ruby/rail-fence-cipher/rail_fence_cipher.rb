module RailFenceArray
  refine Array do
    def split_by_index
      each_with_index.partition { |_letter, index| index.even? }.map do |set|
        set.map { |letter, _index| letter }
      end
    end
  end
end

class RailFenceCipher
  def self.encode(phrase, rails)
    return phrase if invalid?(phrase, rails)
    return encode_two(phrase.chars) if rails == 2
    return encode_three(phrase.chars) if rails == 3
  end

  def self.decode(phrase, rails)
    return phrase if invalid?(phrase, rails)
    return decode_two(phrase.chars) if rails == 2
    return decode_three(phrase.chars) if rails == 3
  end

  class << self
    def invalid?(phrase, rails)
      phrase == '' || rails > phrase.length || rails == 1
    end

    def decode_two(chars)
      middle = (chars.length / 2.0).ceil
      chars[0, middle].zip(chars[middle..-1]).join
    end

    def decode_three(chars)
      top, middle, bottom = find_rails(chars)
      reconstruct(top, middle, bottom)
    end

    def find_rails(chars)
      first = (chars.length / 4.0).ceil
      second = chars.length / 2
      third = chars.length / 4
      [chars[0, first], chars[first, second], chars[-third..-1]]
    end

    def reconstruct(top, middle, bottom, i = 0, output = '')
      segment = [top[i], bottom[i]].zip([middle[i * 2], middle[i * 2 + 1]])
      output << segment.join
      return output if segment.flatten.compact.length < 4
      reconstruct(top, middle, bottom, i += 1, output)
    end

    using RailFenceArray
    def encode_two(chars)
      chars.split_by_index.join
    end

    def encode_three(chars)
      outer, middle = chars.split_by_index
      top, bottom = outer.split_by_index
      [top, middle, bottom].join
    end
  end
  
  VERSION = 1
end
