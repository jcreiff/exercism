class Complement

  def self.of_dna(strand)
    transcribed = strand.split("").map{|base| PAIRS[base]}.join
    transcribed.length == strand.length ? transcribed : ''
  end

  PAIRS = {'C'=>'G', 'G'=>'C', 'T'=>'A', 'A'=>'U'}

end

module BookKeeping
  VERSION = 4
end
