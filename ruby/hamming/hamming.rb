class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError, 'Strands must be of equal length' if strand1.size != strand2.size
    (0..strand1.size).count { |i| strand1[i] != strand2[i] }
  end
end

module BookKeeping
  VERSION = 3
end
