class ETL
  def self.transform(input)
    input.each_with_object({}) do |(score, letters), transformed|
      letters.map { |letter| transformed[letter.downcase] = score }
    end
  end
end

module BookKeeping
  VERSION = 1
end
