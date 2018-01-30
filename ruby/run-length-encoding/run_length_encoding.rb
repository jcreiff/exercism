class RunLengthEncoding
  attr_reader :chars

  def initialize
    @chars = []
  end

  def encode(input)
    split_chars(input.chars)
    combine_chars
  end

  def split_chars(input, index = 0)
    return chars if input == []
    index += 1 until input[index] != input[index + 1]
    chars << input[0..index].join
    input.slice!(0, index + 1)
    split_chars(input)
  end

  def combine_chars
    counts = chars.map { |char_set| char_set.length.to_s }.map { |count| count == '1' ? '' : count }
    letters = chars.map { |char_set| char_set[0] }
    counts.zip(letters).join
  end

  def decode(input)
    split_nums_and_chars(input)
    write_out_chars
  end

  def split_nums_and_chars(input, index = 0)
    return chars if input == ''
    if input[index].to_i.zero?
      chars << input[index]
    else
      index += 1 until input[index + 1].to_i.zero?
      chars << input[0..index].to_i
    end
    input.slice!(0, index + 1)
    split_nums_and_chars(input)
  end

  def write_out_chars(index = 0, string = '')
    return string if chars[index].nil?
    if chars[index].class == Fixnum
      string += (chars[index + 1] * chars[index])
      index += 2
    else
      string += chars[index]
      index += 1
    end
    write_out_chars(index, string)
  end

  def self.encode(input)
    RunLengthEncoding.new.encode(input)
  end

  def self.decode(input)
    RunLengthEncoding.new.decode(input)
  end
end

module BookKeeping
  VERSION = 3
end
