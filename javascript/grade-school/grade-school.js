var School = function() {
  var roster = {};
  this.roster = fullRoster;

  function fullRoster() {
    return roster;
  }

  School.prototype.add = function (student, grade){
    if (roster[grade] == undefined){
      roster[grade] = [student];
    }
    else {
      roster[grade].push(student);
      roster[grade].sort();
    }
  };

  School.prototype.grade = function(level){
    return roster[level]==undefined ? [] : roster[level];
  };
};

module.exports = School;
