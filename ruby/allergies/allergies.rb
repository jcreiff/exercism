class Allergies
  attr_reader :list

  def initialize(score)
    @score = score > 255 ? adjust(score) : score
    @all_allergies = parse_score(@score)
    @list = @all_allergies.select { |_h, k| k }.keys.reverse
  end

  def allergic_to?(allergen)
    @all_allergies[allergen]
  end

  def parse_score(score)
    ALLERGENS.each_with_object({}) do |(number, allergen), hash|
      hash[allergen] = score - number >= 0
      score -= number if hash[allergen]
    end
  end

  def adjust(score, limit = 8)
    limit += 1 until 2**limit > score
    limit.downto(8).map { |i| 2**i }.each { |n| score -= n if score - n >= 0 }
    score
  end

  ALLERGENS = Hash[128, 'cats', 64, 'pollen', 32, 'chocolate', 16, 'tomatoes',
                   8, 'strawberries', 4, 'shellfish', 2, 'peanuts', 1, 'eggs']
end

module BookKeeping
  VERSION = 1
end
