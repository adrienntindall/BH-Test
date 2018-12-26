///move_curved(spd, theta, tilemap)

var spd = argument0;
var theta = argument1;
var tilemap = argument2;

if(tilemap_get_at_pixel(tilemap, x+spd*cos(theta), y-spd*sin(theta)) != 0) instance_destroy();

x += spd*cos(theta);
y += -spd*sin(theta);