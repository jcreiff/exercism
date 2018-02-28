class Garden
  ROSTER = %i[alice bob charlie david eve fred ginny harriet ileana joseph
              kincaid larry].freeze
  PLANTS = Hash['C', :clover, 'G', :grass, 'R', :radishes, 'V', :violets]

  def initialize(plants, students = ROSTER)
    @plants = plants.split("\n").map { |row| row.scan(/\w\w/) }.transpose
    @students = students.sort.map { |name| name.downcase.to_sym }
  end

  def method_missing(method)
    @students.include?(method) ? assign_plants(@students.index(method)) : super
  end

  def respond_to_missing?(method, *)
    @students.include?(method) || super
  end

  private

  def assign_plants(index)
    @plants[index].join.chars.map(&PLANTS.method(:[]))
  end
end
