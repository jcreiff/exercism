const SYMBOLS = {'plus': '+', 'minus': '-', 'multiplied': '*', 'divided': '/'};
const ArgumentError = function(){};

var WordProblem = function(input){
  this.numbers = input.match(/-?\d+/g);
  this.actions = input.match(/plus|minus|multiplied|divided/g);
  if (this.actions){
    this.operators = this.actions.map(x => SYMBOLS[x]);
  }
};

WordProblem.prototype.answer = function(){
  if (!this.actions || !this.numbers){ throw new ArgumentError(); }
  var total = this.numbers[0];
  for(var i = 0; i + 1 <= this.numbers.length; i++){
    total = eval([total, this.operators[i], this.numbers[i + 1]].join(' '));
  }
  return total;
};

module.exports = {
  WordProblem: WordProblem,
  ArgumentError: ArgumentError
};
