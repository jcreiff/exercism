var names = [];
const ALPHA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

var Robot = function() {
  this.name = this.name || makeName();
  this.reset = function(){
    this.name = makeName();
  };

  function makeName() {
    var newName = randomLetters() + randomNumbers();
    if (names.indexOf(newName)!= -1) {
      return makeName();
    }
    else {
      names.push(newName);
      return newName;
    }
  }

  function randomLetters() {
    return ['', ''].map(x => ALPHA[Math.floor(Math.random() * 26)]).join('');
  }

  function randomNumbers() {
    return (Math.random() * 1000).toFixed().padStart(3, 0);
  }
};

module.exports = Robot;
