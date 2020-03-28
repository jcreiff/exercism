require 'forwardable'

class Nucleotide
  extend Forwardable
  BASES = %w[A T C G].freeze

  def initialize(strand)
    @strand = strand
  end

  def_delegator :@strand, :count

  def histogram
    BASES.map { [_1, count(_1)] }.to_h
  end

  def self.from_dna(strand)
    raise ArgumentError, 'Invalid DNA Strand' if strand =~ /[^ACTG]/
    new(strand)
  end
end
