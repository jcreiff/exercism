var RotationalCipher = function(){};

const CAPITAL = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
const LOWERCASE = 'abcdefghijklmnopqrstuvwxyz'.split('');

RotationalCipher.prototype.rotate = function(phrase, distance){
  return phrase.split('').map(function(char){
    if (char.match(/[^A-Za-z]/)) {
      return char;
    }
    else {
      var set = char.match(/[A-Z]/) ? CAPITAL : LOWERCASE;
      return set[(set.indexOf(char) + distance) % 26];
    }
  }).join('');
};

module.exports = RotationalCipher;
