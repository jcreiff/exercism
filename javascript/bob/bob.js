var Bob = function() {};

Bob.prototype.hey = function(statement) {
  if (statement.trim() == '') {
    return 'Fine. Be that way!';
  }
  else if (statement.replace(/[^A-Za-z]/g, '').match(/^[A-Z]+$/)) {
    return 'Whoa, chill out!';
  }
  else if (statement.trim().endsWith('?')) {
    return 'Sure.';
  }
  else {
    return 'Whatever.';
  }
};

module.exports = Bob;
