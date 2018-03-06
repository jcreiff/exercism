class Transpose
  def self.transpose(input)
    return '' if input == "\n"
    phrase = input.split("\n")
    max_length = phrase.map(&:length).max
    answer = Array.new(max_length, '')
    phrase.each do |row|
      row.ljust(max_length).chars.each_with_index do |letter, index|
        answer[index] += letter
      end
    end
    answer.map(&:rstrip).join("\n")
  end
end

module BookKeeping
  VERSION = 1
end
