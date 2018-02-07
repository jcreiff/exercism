class RailFenceCipher
  def self.encode(phrase, rails)
    return phrase if phrase == '' || rails > phrase.length || rails == 1
    rail = 0
    direction = :down
    (0...phrase.size).each_with_object(Array.new(rails) { [] }) do |i, encoded|
      encoded[rail] << phrase.chars[i]
      direction == :down ? rail += 1 : rail -= 1
      direction = switch(direction) if rail.zero? || rail == rails - 1
    end.join
  end

  def self.decode(phrase, rails, output = Array.new(phrase.length), start = 0, current = rails)
    return phrase if (phrase == '' || rails == 1) && start.zero?
    return output.join if output.size == output.compact.size
    index = start
    slice_count = 0
    phrase.chars.each do |char|
      output[index] = char
      index += current == 1 ? SPACERS[rails] : SPACERS[current]
      break if index > output.length - 1
      slice_count += 1
    end
    phrase.slice!(0..slice_count)
    decode(phrase, rails, output, start + 1, current - 1)
  end

  class << self
    private

    def switch(current)
      current == :down ? :up : :down
    end
  end

  SPACERS = { 1 => 1, 2 => 2, 3 => 4 }.freeze
  VERSION = 1
end
