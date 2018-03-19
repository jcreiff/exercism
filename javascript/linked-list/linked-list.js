var LinkedList = function(){
  Array.call(this);
};

LinkedList.prototype = Object.create(Array.prototype);
LinkedList.prototype.constructor = LinkedList;

LinkedList.prototype.count = function() {
  return this.length;
};

LinkedList.prototype.delete = function(item){
  this.splice(this.indexOf(item), 1);
};

module.exports = LinkedList;
