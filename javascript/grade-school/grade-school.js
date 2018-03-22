class School {
  constructor(){
    this.students = {};
  }

  add(student, grade){
    if (this.students[grade]){
      this.students[grade].push(student);
      this.students[grade].sort();
    }
    else {
      this.students[grade] = [student];
    }
  }

  grade(level){
    return this.students[level] || [];
  }

  roster(){
    return this.students;
  }
}

module.exports = School;
