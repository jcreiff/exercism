class WordProblem
  SIGNS = %w[plus minus multiplied divided].zip(%I[+ - * /]).to_h.freeze

  def initialize(question)
    @numbers = question.scan(/-?\d+/).map(&:to_i)
    @operations = question.scan(/plus|minus|multiplied|divided/)
    @valid = @numbers.count - @operations.count == 1 && @operations.count > 0
  end

  def answer
    raise ArgumentError, 'Invalid Problem' unless @valid
    (0...@numbers.length - 1).reduce(@numbers[0]) do |sum, i|
      operate(sum, @operations[i], @numbers[i + 1])
    end
  end

  private

  def operate(number1, operation, number2)
    number1.send(SIGNS[operation], number2)
  end
end

module BookKeeping
  VERSION = 1
end
