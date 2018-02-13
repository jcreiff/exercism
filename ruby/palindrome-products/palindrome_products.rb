module Palindromic
  refine Integer do
    def palindrome?
      to_s == to_s.reverse
    end
  end
end

class Hash
  %i[value factors].each { |prop| define_method(prop) { self[prop] } }
end

class Palindromes
  def initialize(min_factor: 1, max_factor:)
    @range = (min_factor..max_factor).to_a
    @collection = Hash.new { |h, k| h[k] = { value: k, factors: [] } }
  end

  def largest
    @collection.max.last
  end

  def smallest
    @collection.min.last
  end

  using Palindromic
  def generate
    @range.repeated_combination(2)
          .partition { |set| set.reduce(:*).palindrome? }.first
          .each { |pal| @collection[pal.reduce(:*)][:factors] << pal }
  end
end
