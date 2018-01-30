class RunLengthEncoding
  def self.encode(input)
    chars = input.chars
    next_index = 0
    groups = chars.slice_after do |char|
      next_index += 1
      char != chars[next_index]
    end
    groups.map { |g| (g.count == 1 ? '' : g.count.to_s) + g[0] }.join
  end

  def self.decode(input)
    separated = input.split(/(\D)/)
    sets = separated.slice_after { |char| char.to_i.zero? }.reject(&:empty?)
    sets.map { |set| set[1].nil? ? set[0] : set[1] * set[0].to_i }.join
  end
end

module BookKeeping
  VERSION = 3
end
