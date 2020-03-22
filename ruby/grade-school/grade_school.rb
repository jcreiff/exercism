class School
  def initialize
    @roll = Hash.new { [] }
  end

  def students(grade)
    @roll[grade]
  end

  def add(name, grade)
    (@roll[grade] <<= name).sort!
  end

  def students_by_grade
    @roll.sort.map { { grade: _1, students: _2 } }
  end
end
