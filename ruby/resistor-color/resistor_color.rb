class ResistorColor

  def self.color_code(color)
    COLORS.index(color)
  end

  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
end
