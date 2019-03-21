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
var dx = spd*dt*cos(theta);
var dy = -spd*dt*sin(theta);

with(obj_barrier) {
	if(lines_cross(xcorn1, ycorn1, xcorn1, ycorn2, other.x, other.y, other.x+dx, other.y+dy) || lines_cross(xcorn2, ycorn2, xcorn2, ycorn1, other.x, other.y, other.x+dx, other.y+dy)) {
		other.theta = pi-other.theta;
		other.image_angle = 180-other.image_angle;	
	}
	else if(lines_cross(xcorn1, ycorn1, xcorn2, ycorn1, other.x, other.y, other.x+dx, other.y+dy) || lines_cross(xcorn2, ycorn2, xcorn1, ycorn2, other.x, other.y, other.x+dx, other.y+dy)) {
		other.theta *= -1;
		other.image_angle *= -1;	
	}
}
x += spd*dt*cos(theta);
y += -spd*dt*sin(theta);
spd = a < 0 ? max(spd+dt*a, minspd) : (a == 0 ? spd : min(spd+dt*a, maxspd));