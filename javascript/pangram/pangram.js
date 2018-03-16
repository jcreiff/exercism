var Pangram = function(phrase){
  this.phrase = phrase.toLowerCase();
};

Pangram.prototype.isPangram = function() {
  return ALPHA.every(x => this.phrase.search(x) != -1);
};

const ALPHA = 'abcdefghijklmnopqrstuvwxyz'.split('');

module.exports = Pangram;
