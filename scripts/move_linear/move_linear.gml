///move_linear()

dt = global.dt;

if(tilemap_get_at_pixel(tilemap, x+spd*dt*cos(theta), y-spd*dt*sin(theta)) != 0) instance_destroy();

x += spd*dt*cos(theta);
y += -spd*dt*sin(theta);