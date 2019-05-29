///move_eq(eq)
///@param eq
var eq = argument0;

if(tilemap_get_at_pixel(tilemap, x+dt*spd*cos(theta), y-dt*spd*sin(theta)) != 0) instance_destroy();

x = x0 + dt*spd*(t*cos(theta) + eq*sin(theta));
y = y0 + dt*spd*(eq*cos(theta)- t*sin(theta));