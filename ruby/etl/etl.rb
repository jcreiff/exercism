class ETL
  def self.transform(old)
    old.flat_map { _2.map(&:downcase).product([_1]) }.to_h
  end
end
