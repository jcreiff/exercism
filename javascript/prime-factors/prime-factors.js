exports.for = function(number){
  var i = 2;
  var factors = [];
  while (i <= number){
    if (number % i===0){
      factors.push(i);
      number /= i;
      i = 2;
    }
    else {
      i += (i === 2 ? 1 : 2);
    }
  }
  return factors;
};
