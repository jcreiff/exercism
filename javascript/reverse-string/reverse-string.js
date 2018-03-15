function reverseString(input) {
  if (!input) {
    return '';
  }
  var reversed = '';
  for (var i = input.length - 1; i >= 0; i--) {
    reversed += input[i];
  }
  return reversed;
}

module.exports = reverseString;
