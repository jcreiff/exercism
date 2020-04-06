class BookStore
  DISCOUNTS = { 1 => 8.0, 2 => 15.2, 3 => 21.6, 4 => 25.6, 5 => 30.0 }.freeze
  SPECIAL_CASES = { [2, 2, 4, 4, 4] => [4, 4, 4, 4],
                    [1, 1, 2, 2, 2] => [2, 2, 2, 2] }.freeze

  def initialize(purchase)
    @price = 0.0
    @basket = purchase.tally.values.sort
  end

  def calculate_price
    return @price if @basket.empty?
    @basket = SPECIAL_CASES[@basket].dup || @basket
    @price += DISCOUNTS[@basket.size]
    @basket.map! { _1 - 1 }.reject!(&:zero?)
    calculate_price
  end

  def self.calculate_price(purchase)
    new(purchase).calculate_price
  end
end
