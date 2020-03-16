class ResistorColorDuo

  def self.value(*args)
    args[0].take(2).map { |i| COLORS.index(i) }.join.to_i
  end

  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
end
