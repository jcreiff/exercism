class PhoneNumber
  def self.clean(input)
    input.gsub(/\D/, '').match(/^1?([2-9]\d{2}[2-9]\d{2}\d{4})$/) { $1 }
  end
end
