var DnaTranscriber = function() {};
const RNAPAIRS = {'C':'G', 'G':'C', 'A':'U', 'T':'A'};

DnaTranscriber.prototype.toRna = function(input) {
  if (input.match(/[^CGAT]/)) {
    throw new Error('Invalid input');
  }
  return input.split('').map(x => RNAPAIRS[x]).join('');
};

module.exports = DnaTranscriber;
