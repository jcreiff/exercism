class RunLengthEncoding
  def self.encode(input)
    input.chars.chunk(&:itself).map { [_2[1] ? _2.count : '', _1] }.join
  end

  def self.decode(input)
    input.scan(/(\d*)(\D)/).map { _2 * (_1.empty? ? 1 : _1.to_i) }.join
  end
end
