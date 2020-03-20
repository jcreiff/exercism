module BobBrain
  refine String do
    def shouting?
      check = dup.gsub(/[^A-Za-z]/, '')
      !check.empty? && check == check.upcase
    end

    def question?
      self[-1] == '?'
    end

    def silence?
      empty?
    end
  end
end

class Bob
  using BobBrain
  def self.hey(remark)
    case remark.strip
    when -> { _1.shouting? && _1.question? }
      "Calm down, I know what I'm doing!"
    when -> { _1.shouting? }
      'Whoa, chill out!'
    when -> { _1.question? }
      'Sure.'
    when -> { _1.silence? }
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end
