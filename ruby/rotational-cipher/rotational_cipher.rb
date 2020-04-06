class RotationalCipher
  UPPER = ('A'..'Z').to_a
  LOWER = ('a'..'z').to_a

  def self.rotate(text, steps)
    text.tr([UPPER, LOWER].join, [UPPER, LOWER].map { _1.rotate(steps) }.join)
  end
end
