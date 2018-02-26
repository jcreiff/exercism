class Allergies
  attr_accessor :score, :score_list, :list

  def initialize(score)
    @score = score
    @score_list = parse_score
    @list = map_scores
  end

  def allergic_to?(allergen)
    list.include?(allergen)
  end

  def parse_score(allergen_list = [])
    reject_unlisted_allergens if score > 255
    (0..7).to_a.map { |i| 2**i }.reverse.each do |num|
      if score - num >= 0
        allergen_list.unshift(num)
        self.score -= num
      end
    end
    allergen_list
  end

  def map_scores
    score_list.map { |score| ALLERGENS[score] }
  end

  def reject_unlisted_allergens(upper_bound = 9)
    upper_bound += 1 until 2**upper_bound > score
    (8..upper_bound).to_a.map { |i| 2**i }.reverse.each do |num|
      self.score -= num if score - num >= 0
    end
  end

  ALLERGENS = { 1 => 'eggs', 2 => 'peanuts', 4 => 'shellfish',
                8 => 'strawberries', 16 => 'tomatoes', 32 => 'chocolate',
                64 => 'pollen', 128 => 'cats' }.freeze
end

module BookKeeping
  VERSION = 1
end
