class ArmstrongNumbers
  def self.include?(number)
    number.digits.map { |n| n**number.to_s.length }.sum == number
  end
end
