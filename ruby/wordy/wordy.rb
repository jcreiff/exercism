class WordProblem
  attr_reader :words, :numbers, :operations

  def initialize(question)
    @words = parse(question)
    @numbers = words.select.with_index { |_word, index| index.even? }.map { |num| num.to_i }
    @operations = words.select.with_index { |_word, index| index.odd? }
  end

  def answer(total = nil, index = 0)
    return total if index > operations.length - 1
    total.nil? ? num1 = numbers[0] : num1 = total
    total = operate(num1, numbers[index + 1], operations[index])
    answer(total, index + 1)
  end

  def parse(question)
    question.gsub(/[?]|(by)|(to the)|(th)|(power)/, '').split(' ')[2..-1]
  end

  def operate(num1, num2, operation)
    if operation == 'plus'
      num1 + num2
    elsif operation == 'minus'
      num1 - num2
    elsif operation == 'multiplied'
      num1 * num2
    elsif operation == 'divided'
      num1 / num2
    elsif operation == 'raised'
      num1**num2
    else
      raise ArgumentError, 'Invalid operation'
    end
  end
end

module BookKeeping
  VERSION = 1
end
