class Poker
  def initialize(cards)
    @all_hands = cards.map { Hand.new(_1) }
  end

  def best_hand
    @all_hands.select { _1.value == @all_hands.max.value }.map(&:cards)
  end
end

class Hand
  include Comparable
  attr_reader :cards, :value

  def initialize(cards)
    @cards = cards
    @denominations, @suits = cards.map { [_1[0], _1[-1]] }.transpose
    @value = HandEvaluator.new(sorted_cards, flush?).data
  end

  private

  def <=>(other)
    value <=> other.value
  end

  def sorted_cards
    sorted = @denominations.map(&CARD_VALUES.method(:[])).sort
    sorted == [2, 3, 4, 5, 14] ? [1, 2, 3, 4, 5] : sorted
  end

  def flush?
    @suits.uniq.count == 1
  end

  CARD_VALUES = [[*('2'..'9')] + %w[1 J Q K A], [*(2..14)]].transpose.to_h
end

class HandEvaluator
  attr_reader :data

  def initialize(cards, flush)
    @cards = cards
    @flush = flush
    @groups = cards.tally
    @data = ranks[evaluate_hand].flatten
  end

  private

  def evaluate_hand
    if @groups.count == 2
      @groups.values.sort == [2, 3] ? :full_house : :four_of_a_kind
    elsif @groups.count == 3
      @groups.values.sort == [1, 2, 2] ? :two_pair : :three_of_a_kind
    else
      @groups.count == 4 ? :pair : straight_or_flush?
    end
  end

  def straight_or_flush?
    if @cards.each_cons(2).all? { _1[0] + 1 == _1[1] }
      @flush ? :straight_flush : :straight
    else
      @flush ? :flush : :high_card
    end
  end

  def ranks
    { high_card: [0, solo], pair: [1, pair, solo], two_pair: [2, pair, solo],
      three_of_a_kind: [3, trio, solo], straight: [4, solo], flush: [5, solo],
      full_house: [6, trio, pair], four_of_a_kind: [7, quad, solo],
      straight_flush: [8, solo] }
  end

  { solo: 1, pair: 2, trio: 3, quad: 4 }.each do |name, total|
    define_method(name) do
      @groups.map { |card, i| card if i == total }.compact.reverse
    end
  end
end
