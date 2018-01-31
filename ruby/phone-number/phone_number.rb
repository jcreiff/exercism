class PhoneNumber
  attr_accessor :input

  def initialize(input)
    @input = input.gsub(/\D/, '')
  end

  def clean
    return nil unless valid_length?
    self.input = input[1..-1] if input.length == 11
    valid_construction? ? input : nil
  end

  def self.clean(input)
    PhoneNumber.new(input).clean
  end

  private

  def valid_length?
    input.length == 10 || input.length == 11 && input[0] == '1'
  end

  def valid_construction?
    [input[0], input[3]].all? { |digit| ('2'..'9').cover?(digit) }
  end
end

module BookKeeping
  VERSION = 2
end
