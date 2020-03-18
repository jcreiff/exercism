class Raindrops
  def self.convert(num)
    result = NOISES.select { |h, _k| (num % h).zero? }
    result.empty? ? num.to_s : result.values.join
  end

  NOISES = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze
end
