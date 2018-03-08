require 'forwardable'

class Dominoes
  def self.chain(input)
    return input if input.empty?
    return nil unless chainable?(input)
    DominoFlipper.new(input).arrange.permutation.find { |set| all_chained(set) }
  end

  def self.chainable?(input)
    (1..6).all? { |i| input.flatten.count(i).even? }
  end

  def self.all_chained(set)
    set.each_cons(2).all? { |d1, d2| d1[1] == d2[0] } && set[0][0] == set[-1][1]
  end

  private_class_method :chainable?, :all_chained
end

class DominoFlipper
  def initialize(dominoes)
    @set = dominoes.map { |spots| Domino.new(spots) }
  end

  def arrange
    until misaligned.empty?
      @set.any?(&exact) ? @set.find(&exact).flip! : @set.find(&any).flip!
    end
    @set.map(&:spots)
  end

  private

  def misaligned
    (1..6).reject { |i| @set.map(&:last).count(i) == @set.map(&:first).count(i) }
  end

  def exact
    proc { |domino| domino.sort == misaligned.sort }
  end

  def any
    proc { |domino| domino.include?(misaligned.first) && !domino.flipped }
  end
end

class Domino
  extend Forwardable
  attr_accessor :spots, :flipped

  def initialize(spots)
    @spots = spots
    @flipped = false
  end

  def_delegators :@spots, :first, :last, :include?, :sort, :==

  def flip!
    spots.reverse!
    @flipped = true
  end
end

module BookKeeping
  VERSION = 1
end
