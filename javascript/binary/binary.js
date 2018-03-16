var Binary = function(number){
  this.number = number;
};

Binary.prototype.toDecimal = function() {
  if (this.number.match(/[^01]/)){
    return 0;
  }
  var values = this.number.split('').reverse().map(function(number, index){
    return number==='1' ? Math.pow(2, index) : parseInt(number);
  });
  return values.reduce((x,y) => x+y);
};

module.exports = Binary;
