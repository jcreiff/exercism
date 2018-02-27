class Poker
  def initialize(cards)
    @all_hands = cards.map { |deal| Hand.new(deal) }
  end

  def best_hand
    find_winners(@all_hands, 0).map(&:cards)
  end

  private

  def find_winners(hands, i)
    winners = hands.select do |hand|
      hand.values[i] == hands.map { |h| h.values[i] }.max
    end
    return winners if winners.count == 1 || winners.first.values[i + 1].nil?
    find_winners(winners, i + 1)
  end
end

class Hand
  attr_reader :cards, :values

  def initialize(cards)
    @cards = cards
    @denominations, @suits = cards.map { |card| [card[0], card[-1]] }.transpose
    @values = HandEvaluator.new(sort_values, flush?).data
  end

  private

  def sort_values
    sorted = @denominations.map(&CARD_VALUES.method(:[])).sort
    sorted == [2, 3, 4, 5, 14] ? [1, 2, 3, 4, 5] : sorted
  end

  def flush?
    @suits.uniq.count == 1
  end

  CARD_VALUES = [[*('2'..'9')] + %w[1 J Q K A], [*(2..14)]].transpose.to_h
end

class HandEvaluator
  attr_reader :cards, :flush, :groups, :data

  def initialize(cards, flush)
    @cards = cards
    @flush = flush
    @groups = cards.each_with_object({}) { |c, h| h[c] = cards.count(c) }
    @rank = evaluate_groups
    @data = hand_details[@rank].flatten
  end

  def evaluate_groups
    if groups.count == 2
      groups.values.sort == [2, 3] ? :full_house : :four_of_a_kind
    elsif groups.count == 3
      groups.values.sort == [1, 2, 2] ? :two_pair : :three_of_a_kind
    else
      groups.count == 4 ? :one_pair : check_for_straight_and_flush
    end
  end

  { solo: 1, pair: 2, trio: 3, quartet: 4 }.each do |name, total|
    define_method(name) do
      groups.map { |card, i| card if i == total }.compact.reverse
    end
  end

  def check_for_straight_and_flush
    if cards.chunk_while { |i, j| i + 1 == j }.to_a.first == cards
      flush ? :straight_flush : :straight
    else
      flush ? :flush : :high_card
    end
  end

  def hand_details
    { high_card: [0, solo], one_pair: [1, pair, solo],
      two_pair: [2, pair, solo], three_of_a_kind: [3, trio, solo],
      straight: [4, solo], flush: [5, solo], full_house: [6, trio, pair],
      four_of_a_kind: [7, quartet, solo], straight_flush: [8, solo] }
  end
end

module BookKeeping
  VERSION = 2
end
