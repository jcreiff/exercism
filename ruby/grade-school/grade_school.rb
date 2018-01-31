class School
  attr_reader :roll

  def initialize
    @roll = Hash.new { |h, k| h[k] = [] }
  end

  def students(grade)
    roll[grade]
  end

  def add(name, grade)
    roll[grade] << name
    roll[grade].sort!
  end

  def students_by_grade
    roll.sort.map { |grade, students| { grade: grade, students: students.dup } }
  end
end

module BookKeeping
  VERSION = 3
end
