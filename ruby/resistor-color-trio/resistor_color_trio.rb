class ResistorColorTrio

  def initialize(colors)
    raise ArgumentError unless colors.all? { |c| COLORS.index(c) }
    @c1, @c2, @c3 = colors
  end

  def label
    "Resistor value: #{value_in_ohms}"
  end

private

  def value_in_ohms
    value = [@c1, @c2].map { |c| COLORS.index(c) }.join.to_i * 10**COLORS.index(@c3)
    (value % 1000).zero? ? "#{value / 1000} kiloohms" : "#{value} ohms"
  end

  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
end
