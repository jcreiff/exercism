class RunLengthEncoding
  def self.encode(input)
    chars = input.squeeze.chars
    counts = chars.map { |char| input.count(char) }
    counts.zip(chars).flatten.reject { |char| char == 1 }.join
  end

  def self.decode(input)
    separated = input.split(/(\D)/)
    sets = separated.slice_after { |x| x.to_i == 0}.reject { |set| set == ['']}
    sets.map { |set| set[1].nil? ? set[0] : set[1] * set[0].to_i }.join
  end
end

module BookKeeping
  VERSION = 3
end
