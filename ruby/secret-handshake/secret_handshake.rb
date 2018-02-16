class SecretHandshake
  def initialize(number)
    @number = number.to_i
    @binary = to_binary(@number)
  end

  def commands
    shake = @binary.reverse[0...-1]
                   .map.with_index { |num, i| ACTIONS[i] if num == 1 }
                   .compact
    @binary.first.zero? ? shake : shake.reverse
  end

  private

  def to_binary(number)
    [16, 8, 4, 2, 1].each_with_object([]) do |i, set|
      if number - i < 0
        set.push(0)
      else
        set.push(1)
        number -= i
      end
    end
  end

  ACTIONS = %w[wink double\ blink close\ your\ eyes jump].freeze
end
