///move_eq(eq)

var eq = argument0;

if(tilemap_get_at_pixel(tilemap, x+spd*cos(theta), y-spd*sin(theta)) != 0) instance_destroy();

x = x0 + spd*(t*cos(theta) + eq*sin(theta));
y = y0 + spd*(eq*cos(theta)- t*sin(theta));