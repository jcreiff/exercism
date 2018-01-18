class Hamming

  def self.compute(first_strand, second_strand, distance=0)
    raise ArgumentError, "Strands must be of equal length" if first_strand.length != second_strand.length
    first_strand_bases = first_strand.split("")
    second_strand.split("").each_with_index do |base, index|
      distance+=1 if base != first_strand_bases[index]
    end
    distance
  end

end

module BookKeeping
  VERSION = 3
end
