class SecretHandshake
  attr_reader :commands

  def initialize(num)
    @commands = to_binary(num.to_i)
  end

  def to_binary(num, handshake = [])
    [16, 8, 4, 2, 1].each_with_index do |i, index|
      next if num - i < 0
      handshake.unshift(ACTIONS[index])
      num -= i
      break if num.zero?
    end
    handshake.last == 'reverse' ? handshake[0...-1].reverse : handshake
  end

  ACTIONS = %w[reverse jump close\ your\ eyes double\ blink wink].freeze
end
