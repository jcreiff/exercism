module.exports = function School(){
  let students = {};

  this.add = function(student, grade){
    if(students[grade]){
      students[grade].push(student);
      students[grade].sort();
    }
    else{
      students[grade] = [student];
    }
  };

  this.grade = (level) => students[level] || [];
  this.roster = () => students;
};
