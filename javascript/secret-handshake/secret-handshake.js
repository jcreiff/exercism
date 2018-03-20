var SecretHandshake = function(num){
  this.binary = toBinary(num);
};

function toBinary(num, digits = []){
  if (!Number.isInteger(num)) {
    throw new Error('Handshake must be a number');
  }
  [16,8,4,2,1].forEach(function(div){
    if (num - div >= 0){
      digits.push(1);
      num -= div;
    }
    else{
      digits.push(0);
    }
  });
  return digits;
}

SecretHandshake.prototype.commands = function(combo = []){
  this.binary.reverse().forEach(function(digit, index){
    if (digit===1){
      index===4 ? combo.reverse() : combo.push(ACTIONS[index]);
    }
  });
  return combo;
};

const ACTIONS = ['wink', 'double blink', 'close your eyes', 'jump'];

module.exports = SecretHandshake;
