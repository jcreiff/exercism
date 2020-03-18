class Luhn
  def initialize(number)
    @number = number
  end

  def valid?
    digits = valid_input
    digits && (checksum(digits) % 10).zero?
  end

  def self.valid?(num)
    new(num).valid?
  end

  private

  def valid_input
    input = @number.dup.delete(' ')
    input !~ /\D/ && input.size > 1 ? input.to_i.digits : nil
  end

  def replace(num)
    num < 5 ? num * 2 : num * 2 - 9
  end

  def checksum(input)
    input.map.with_index { _2.odd? ? replace(_1) : _1 }.sum
  end
end

module BookKeeping
  VERSION = 1
end
