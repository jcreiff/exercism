var Matrix = function(input){
  this.input = input.split(/\n/);
  this.rows = this.input.map(x => x.split(' ').map(x => parseInt(x)));
  this.columns = transpose(this.rows);
};

function transpose(rows){
  var columns = [...Array(rows[0].length).keys()].map(x => new Array);
  rows.forEach(function(row){
    row.forEach(function(item, index){
      columns[index].push(item);
    });
  });
  return columns;
}

module.exports = Matrix;
