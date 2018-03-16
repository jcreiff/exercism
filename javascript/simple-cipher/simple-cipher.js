var Cipher = function(key = generateKey()){
  validate(key);
  this.key = key;
};

function generateKey(){
  var key = '';
  for(var i = 0; i < 100; i++){
    key += ALPHA[Math.floor(Math.random() * 26, 1)];
  }
  return key;
}

function validate(key){
  if (!key.match(/^[a-z]+$/)){
    throw new Error('Bad key');
  }
}

function getPositions(text, length){
  while(text.length < length){
    text += text;
  }
  return text.split('').map(x => ALPHA.indexOf(x));
}

Cipher.prototype.encode = function(text){
  var original = getPositions(text);
  var encoding = getPositions(this.key, original.length);
  var transformed = original.map(function(value, index){
    return ALPHA[(value + encoding[index]) % 26];
  });
  return transformed.join('');
};

Cipher.prototype.decode = function(text){
  var original = getPositions(text);
  var encoding = getPositions(this.key, original.length);
  var transformed = original.map(function(value, index){
    return ALPHA[(value - encoding[index] + 26) % 26];
  });
  return transformed.join('');
};

const ALPHA = 'abcdefghijklmnopqrstuvwxyz'.split('');

module.exports = Cipher;
