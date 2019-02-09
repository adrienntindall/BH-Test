///move_pulse(dis, coffset)
///@param dis
///@param c_offset
///@param wspd
var dis = argument0;
var coff = argument1;

var dx = coff + dis*abs(sin(t));
var dy = coff + dis*abs(sin(t));

x = x0 + cos(theta)*dx;
y = y0 - sin(theta)*dy;

t+=tspd*global.dt;
tspd += ta*global.dt;