var List = function(input = new Array){
  this.values = input;
};

List.prototype.append = function(other){
  let values = this.values;
  if(other.values.length !== 0){
    other.values.forEach(function(item){
      values.push(item);
    });
  }
  return this;
};

List.prototype.concat = function(other){
  return this.append(other);
};

List.prototype.filter = function(block){
  let values = this.values;
  this.values.forEach(function(item, index){
    if(!block(item)){
      values.splice(index, 1);
    }
  });
  return this;
};

List.prototype.length = function(){
  var count = 0;
  this.values.forEach(function(){
    count += 1;
  });
  return count;
};

List.prototype.map = function(block){
  let values = this.values;
  this.values.forEach(function(item, index){
    values[index] = block(item);
  });
  return this;
};

List.prototype.foldl = function(operation, total){
  if (this.values.length===0){
    return total;
  }
  this.values.forEach(function(item, index){
    if (index % 2 === 0){
      total = operation(total, item);
    }
    else {
      total = operation(total, 1 / item);
    }
  });
  return total;
};

List.prototype.foldr = function(operation, total){
  return this.reverse().foldl(operation, total);
};

List.prototype.reverse = function(){
  let values = [];
  for(var i = this.length() - 1; i >= 0; i--){
    values.push(this.values[i]);
  }
  return new List(values);
};

module.exports = List;
