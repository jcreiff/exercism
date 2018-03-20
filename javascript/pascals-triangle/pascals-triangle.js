var Triangle = function(height){
  this.rows = constructTriangle(height);
  this.lastRow = this.rows[height - 1];
};

function constructTriangle(height){
  var output = [];
  for (var i = 0; i < height; i++){
    output.push(constructRow(i));
  }
  return output;
}

function constructRow(row){
  var line = [1];
  for (var i = 0; i < row; i++){
    line.push(line[i] * (row - i) / (i + 1));
  }
  return line;
}

module.exports = Triangle;
