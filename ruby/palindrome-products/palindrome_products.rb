module Palindromic
  refine Integer do
    def palindrome?
      to_s == to_s.reverse
    end
  end
end

class Palindromes
  attr_reader :smallest, :largest

  using Palindromic
  def initialize(min_factor: 1, max_factor:)
    @factor_range = (min_factor..max_factor).to_a
    @pal_range = (min_factor**2..max_factor**2).to_a.select(&:palindrome?)
    @smallest = { value: nil, factors: [] }
    @largest = { value: nil, factors: [] }
  end

  def generate
    low = @pal_range.find { |pal| divisible_in_range(pal) }
    high = @pal_range.reverse.find { |pal| divisible_in_range(pal) }
    smallest[:value] = low
    largest[:value] = high
    smallest[:factors] = find_factors(low).uniq
    largest[:factors] = find_factors(high).uniq
  end

  private

  def divisible_in_range(pal)
    @factor_range.any? { |num| (pal % num).zero? && @factor_range.include?(pal / num) }
  end

  def find_factors(pal)
    @factor_range.select { |factor| (pal % factor).zero? }.map { |factor| [factor, pal/factor].sort }.reject { |set| set.any? { |num| !@factor_range.include?(num) } }
  end
end

class Hash
  %i[value factors].each do |prop|
    define_method(prop) { self[prop] }
  end
end
