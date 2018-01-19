DIGITS = { 1000=>'M', 900=>'CM', 500=>'D', 400=>'CD', 100=>'C', 90=>'XC',
           50=>'L',  40=>'XL', 10=>'X', 9=>'IX', 5=>'V', 4=>'IV', 1=>'I' }

class Fixnum
  def to_roman
    string = ''
    total = self
    DIGITS.each do |arabic, roman|
      dividend, remainder = total.divmod(arabic)
      next if dividend.zero?
      string += roman * dividend
      total = remainder
    end
    string
  end
end

module BookKeeping
  VERSION = 2
end
