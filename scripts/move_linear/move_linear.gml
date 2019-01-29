///move_linear()

var dt = global.dt;

if(wall_collision(tilemap, id, spd*dt*cos(theta), -spd*dt*sin(theta))) {
	switch(object_index) {
		case obj_knife:
			mode = 2;
			break;
		case obj_split_spawner:
			theta = (wall_collision(tilemap, id, spd*dt*cos(theta), 0)) ? pi-theta : theta;
			theta = (wall_collision(tilemap, id, 0, -spd*dt*sin(theta))) ? -theta : theta;
			break;
		default:
			instance_destroy();
			break;
	}
}
x += spd*dt*cos(theta);
y += -spd*dt*sin(theta);
spd = a < 0 ? max(spd+dt*a, minspd) : (a == 0 ? spd : min(spd+dt*a, maxspd));