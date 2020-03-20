module Roman
  DIGITS = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
             90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX', 5 => 'V',
             4 => 'IV', 1 => 'I' }.freeze

  def to_roman
    total = dup
    DIGITS.each_with_object('') do |(arabic, roman), result|
      dividend, remainder = total.divmod(arabic)
      result << roman * dividend
      total = remainder
    end
  end
end

Integer.include(Roman)
