///move_linear()

var dt = global.dt;

if(tilemap_get_at_pixel(tilemap, x+spd*dt*cos(theta), y-spd*dt*sin(theta)) != 0) {
	switch(object_index) {
		case obj_knife:
			mode = 2;
			break;
		default:
			instance_destroy();
			break;
	}
}
x += spd*dt*cos(theta);
y += -spd*dt*sin(theta);