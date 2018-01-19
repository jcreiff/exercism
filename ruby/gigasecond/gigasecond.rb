class Gigasecond
  def self.from(birth)
    Time.at(birth.to_i + 1_000_000_000)
  end
end

module BookKeeping
  VERSION = 6
end
