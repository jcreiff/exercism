class Raindrops
  def self.convert(num, drops = [])
    [3, 5, 7].map { |factor| drops << NOISES[factor] if (num % factor).zero? }
    drops == [] ? num.to_s : drops.join
  end

  NOISES = { 3 => :Pling, 5 => :Plang, 7 => :Plong }
end

module BookKeeping
  VERSION = 3
end
