require 'forwardable'

class Nucleotide
  extend Forwardable

  def initialize(strand)
    @strand = strand
  end

  def_delegator :@strand, :count

  def histogram
    BASES.each_with_object({}) { |base, counts| counts[base] = count(base) }
  end

  def self.from_dna(strand)
    raise ArgumentError, 'Invalid DNA Strand' if strand =~ /[^ACTG]/
    new(strand)
  end

  BASES = %w[A T C G].freeze
end
