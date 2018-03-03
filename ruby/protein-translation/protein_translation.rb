class Translation
  def self.of_codon(codon)
    PROTEINS[codon]
  end

  def self.of_rna(strand)
    raise InvalidCodonError, 'Invalid Codon' if strand =~ /[^AUCG]/
    strand.chars.each_slice(3).map { |codon| PROTEINS[codon.join] }
          .slice_before { |protein| protein == 'STOP' }.first
  end

  PROTEINS = { 'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
               'UUC' => 'Phenylalanine', 'UUA' => 'Leucine', 'UUG' => 'Leucine',
               'UCU' => 'Serine', 'UCC' => 'Serine', 'UCA' => 'Serine',
               'UCG' => 'Serine', 'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
               'UGU' => 'Cysteine', 'UGC' => 'Cysteine', 'UGG' => 'Tryptophan',
               'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP' }.freeze
end

class InvalidCodonError < StandardError
end
