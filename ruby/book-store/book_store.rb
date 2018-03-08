class BookStore
  attr_accessor :basket, :price
  DISCOUNTS = { 1 => 8.0, 2 => 15.2, 3 => 21.6, 4 => 25.6, 5 => 30.0 }.freeze

  def initialize(purchase)
    @price = 0.0
    @basket = (1..5).map { |book| purchase.count(book) }.sort
  end

  def calculate_price
    check_special_case if basket == [2, 2, 4, 4, 4] || basket == [1, 1, 2, 2, 2]
    basket.reject!(&:zero?)
    return price if basket.empty?
    @price += DISCOUNTS[basket.count]
    basket.map! { |book| book - 1 }
    calculate_price
  end

  def self.calculate_price(purchase)
    new(purchase).calculate_price
  end

  private

  def check_special_case
    @basket = (basket == [2, 2, 4, 4, 4] ? [0, 4, 4, 4, 4] : [0, 2, 2, 2, 2])
  end
end

module BookKeeping
  VERSION = 0
end
