require 'set'

class Pangram
  def self.pangram?(phrase)
    phrase.downcase!
    ("a".."z").to_a.each do |letter|
      phrase.count(letter) == 0 ? return : next
    end
    return true
  end
end

module BookKeeping
  VERSION = 6
end
