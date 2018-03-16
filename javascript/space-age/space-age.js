const ORBITALPERIODS = { 'Earth': 1, 'Mercury': 0.2408467, 'Venus': 0.61519726,
  'Mars': 1.8808158, 'Jupiter': 11.862615, 'Saturn': 29.447498,
  'Uranus': 84.016846, 'Neptune': 164.79132
};

var SpaceAge = function(seconds){
  this.seconds = seconds;
};

Object.keys(ORBITALPERIODS).forEach(function(planet){
  SpaceAge.prototype['on' + planet] = function(){
    return parseFloat((this.seconds / 31557600 / ORBITALPERIODS[planet]).toFixed(2));
  };
});

module.exports=SpaceAge;
