class Hamming
  def self.compute(str1, str2)
    raise ArgumentError, 'Strands of unequal length' if str1.size != str2.size
    (0..str1.size).count { str1[_1] != str2[_1] }
  end
end
