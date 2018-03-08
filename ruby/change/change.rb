class Change
  attr_reader :coins, :amount, :change_options

  def initialize(coins, amount)
    @coins = coins
    @amount = amount
    @change_options = []
  end

  def generate
    return -1 if amount < 0 || (coins.min > amount && amount != 0)
    (0...coins.count).each { |start| find_combos(coins.reverse[start..-1]) }
    find_alternates unless coins.include?(1)
    change_options.empty? ? -1 : change_options.sort_by(&:count).first.sort
  end

  def self.generate(coins, amount)
    Change.new(coins, amount).generate
  end

  private

  def find_combos(coin_set, total = amount, change_combo = [])
    coin_set.each do |coin|
      until coin > total
        total -= coin
        change_combo.unshift(coin)
      end
    end
    validate(change_combo, total)
  end

  def find_alternates(change_combo = [], total = amount)
    coins.each_with_index do |coin, index|
      until coins[index + 1..-1].any? { |c| (total % c).zero? } || total <= 0
        total -= coin
        change_combo.unshift(coin)
      end
    end
    validate(change_combo, total)
  end

  def validate(coins, total)
    change_options.push(coins) if total.zero?
  end
end

module BookKeeping
  VERSION = 2
end
