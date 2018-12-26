///move_linear()

if(tilemap_get_at_pixel(tilemap, x+spd*cos(theta), y-spd*sin(theta)) != 0) instance_destroy();

x += spd*cos(theta);
y += -spd*sin(theta);