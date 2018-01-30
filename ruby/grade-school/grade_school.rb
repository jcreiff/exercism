class School
  attr_reader :roll

  def initialize
    @roll = Hash.new { |h, k| h[k] = [] }
  end

  def students(grade)
    roll[grade].sort
  end

  def add(name, grade)
    roll[grade] << name
  end

  def students_by_grade
    roll.keys.sort.map { |grade| { grade: grade, students: roll[grade].sort } }
  end
end

module BookKeeping
  VERSION = 3
end
