module Palindromic
  refine Integer do
    def palindrome?
      to_s == to_s.reverse
    end
  end
end

class Palindromes
  Palindrome = Struct.new(:value, :factors)

  def initialize(min_factor: 1, max_factor:)
    @range = (min_factor..max_factor).to_a
    @palindromes = Hash.new { |k, v| k[v] = [] }
  end

  def largest
    Palindrome.new(*@palindromes.max)
  end

  def smallest
    Palindrome.new(*@palindromes.min)
  end

  using Palindromic
  def generate
    @range.repeated_combination(2).each do |factors|
      value = factors.reduce(:*)
      @palindromes[value] << factors if value.palindrome?
    end
  end
end
