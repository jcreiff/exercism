class ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.value(bands)
    bands.take(2).map { |i| COLORS.index(i) }.join.to_i
  end
end
