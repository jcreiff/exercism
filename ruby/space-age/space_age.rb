class SpaceAge
  def initialize(seconds)
    @seconds = seconds
  end

  EARTH_YEAR = 31_557_600.0

  ORBIT_LENGTHS = { on_mercury: 0.2408467, on_venus: 0.61519726, on_earth: 1.0,
                    on_mars: 1.8808158, on_jupiter: 11.862615,
                    on_saturn: 29.447498, on_uranus: 84.016846,
                    on_neptune: 164.79132 }.freeze

  ORBIT_LENGTHS.each do |planet, length|
    define_method(planet) { @seconds / EARTH_YEAR / length }
  end
end

module BookKeeping
  VERSION = 1
end
