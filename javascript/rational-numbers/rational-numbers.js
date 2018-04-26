var Rational = function(a, b){
  if (b < 0){
    a *= -1;
    b *= -1;
  }
  var max = a > b ? a : b;
  var gcd = [...Array(max).keys()].map(x => x + 1).reverse().find(function(i){
    return a % i === 0 && b % i === 0;
  });
  this.a = a/gcd;
  this.b = (a === 0 ? 1 : b/gcd);
};

Rational.prototype.add = function(other) {
  return new Rational((this.a * other.b + other.a * this.b), (this.b * other.b));
};

Rational.prototype.sub = function(other) {
  return new Rational((this.a * other.b - other.a * this.b), (this.b * other.b));
};

Rational.prototype.mul = function(other) {
  return new Rational((this.a * other.a),(this.b * other.b));
};

Rational.prototype.div = function(other) {
  return new Rational((this.a * other.b), (this.b * other.a));
};

Rational.prototype.abs = function() {
  return new Rational((this.a < 0 ? this.a * -1 : this.a), this.b);
};

Rational.prototype.exprational = function(power) {
  return new Rational(Math.pow(this.a, power), Math.pow(this.b, power));
};

Rational.prototype.expreal = function(real) {
  return Math.pow(10.0, Math.log10(Math.pow(real, this.a)) / this.b);
};

Rational.prototype.reduce = function() {
  return this;
};

module.exports = Rational;
