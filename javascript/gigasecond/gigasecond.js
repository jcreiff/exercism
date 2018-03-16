var Gigasecond = function(birth) {
  this.birth = birth.getTime();
};

Gigasecond.prototype.date = function() {
  return new Date((this.birth + 1000000000000));
};

module.exports = Gigasecond;
