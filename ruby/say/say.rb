
class Say

  def initialize(number)
    @number=number
    @num_array=@number.to_s.split("")
    @size=@num_array.count
    @num_hash={}
    @phrase=""
  end

  def in_english
    exception_check
    split_num_array
    @num_hash.each do |key, set|
      words = (set.size == 3 ? construct_three_digits(set) : set.size == 2 ? construct_two_digits(set) : single_digits[set.first])
      @phrase.prepend(words + appendages[key]) unless words.empty?
    end
    @phrase.strip
  end

  def exception_check
    raise ArgumentError, "number must be positive" if @number<0
    raise ArgumentError, "number is too big" if @size>12
  end

  def split_num_array
    count = 0
    (@size/3.0).ceil.times do
      if @num_array.length > 3
        @num_hash[count]=@num_array[-3..-1]
        @num_array.slice!(-3..-1)
        count+=1
      else
        @num_hash[count]=@num_array
      end
    end
  end

  def construct_three_digits(digits)
    hundreds = (digits.first == "0" ? "" : single_digits[digits.first] + " hundred ")
    digits[1] == "0" ? (digits[2] == "0" ? hundreds.strip : hundreds + single_digits[digits[2]]) : hundreds + construct_two_digits(digits[1..2])
  end

  def construct_two_digits(digits)
    if digits.first == "1"
      teens[digits.join("")]
    elsif digits.last == "0"
      multiples_of_ten[digits.first]
    else
      multiples_of_ten[digits.first] + "-" + single_digits[digits.last]
    end
  end

  def single_digits
    {"0" => "zero", "1"=>"one", "2"=>"two", "3"=>"three", "4"=>"four", "5"=>"five",
      "6"=>"six", "7"=>"seven", "8"=>"eight", "9"=>"nine"}
  end

  def teens
    {"10"=>"ten", "11"=>"eleven", "12"=>"twelve", "13"=>"thirteen", "14"=>"fourteen", "15"=>"fifteen",
      "16"=>"sixteen", "17"=>"seventeen", "18"=>"eighteen", "19"=>"nineteen"}
  end

  def multiples_of_ten
    {"2"=>"twenty", "3"=>"thirty", "4"=>"forty", "5"=>"fifty", "6"=>"sixty",
      "7"=>"seventy", "8"=>"eighty", "9"=>"ninety"}
  end

  def appendages
    {0=>"", 1=>" thousand ", 2=>" million ", 3=>" billion "}
  end

end

module BookKeeping
  VERSION = 1
end
