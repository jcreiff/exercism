class RunLengthEncoding
  def self.encode(input)
    input.chars.chunk(&:itself).map do |char, set|
      [(set.count == 1 ? '' : set.count), char]
    end.join
  end

  def self.decode(input)
    input.scan(/(\d*)(\D)/).map do |num, char|
      char * (num.empty? ? 1 : num.to_i)
    end.join
  end
end

module BookKeeping
  VERSION = 3
end
