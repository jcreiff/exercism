class Luhn
  def initialize(number)
    @raw_number = number
    @number = number.scan(/\d/).map(&:to_i).reverse
  end

  def valid?
    @number.size > 1 && @raw_number.delete(' ') !~ /\D/ && (checksum % 10).zero?
  end

  def self.valid?(num)
    Luhn.new(num).valid?
  end

  private

  def addends
    @number.map.with_index { |num, i| i.odd? ? replace(num) : num }
  end

  def replace(num)
    num < 5 ? num * 2 : num * 2 + 1
  end

  def checksum
    addends.reduce(:+)
  end
end

module BookKeeping
  VERSION = 1
end
