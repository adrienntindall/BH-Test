///grad(hash, x, y, z)

var h = argument0 & 15;
var xx = argument1;
var yy = argument2;
var z = argument3;

var u = h < 8 ? xx : yy;
var v = h < 4 ? yy : ((h == 12 || h == 14) ? xx : z);
return ((h & 1) == 0 ? u : -u) + ((h & 2) == 0 ? v : -v);