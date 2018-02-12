module Palindromic
  refine Integer do
    def palindrome?
      to_s == to_s.reverse
    end
  end
end

class Palindromes
  def initialize(min_factor: 1, max_factor:)
    @min_factor = min_factor
    @max_factor = max_factor
    @range = (min_factor..max_factor).to_a
    @set = Hash.new { |h, k| h[k] = [] }
  end

  using Palindromic
  def generate
    pals = @range.repeated_permutation(2).select { |pair| pair.reduce(:*).palindrome? }
    pals.map { |pal| @set[pal.reduce(:*)].push(pal.sort) }
  end

  def largest
    { value: @set.keys.max, factors: @set[@set.keys.max].uniq }
  end

  def smallest
    { value: @set.keys.min, factors: @set[@set.keys.min].uniq }
  end
end

class Hash
  def method_missing(name)
    self[name]
  end
end
