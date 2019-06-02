///move_linear()

if(wall_collision(tilemap, id, spd*dt*cos(theta), -spd*dt*sin(theta))) {
	/*if(is_knife) mode = 2;
	else if(is_split_cannon) {
		theta = (wall_collision(tilemap, id, spd*dt*cos(theta), 0)) ? pi-theta : theta;
		theta = (wall_collision(tilemap, id, 0, -spd*dt*sin(theta))) ? -theta : theta;
		image_angle = theta*180/pi;
	}*/
	if(object_index != obj_weapon && object_get_parent(object_index) != obj_weapon) instance_destroy();
}
var dx = spd*dt*cos(theta);
var dy = -spd*dt*sin(theta);

with(obj_barrier) {
	if(deep_lines_cross(xcorn2, ycorn2, xcorn2, ycorn1, other, dx, dy) || deep_lines_cross(xcorn1, ycorn2, xcorn1, ycorn1, other, dx, dy)) {
		bar_vert_eff(other.id);
	}
	if(deep_lines_cross(xcorn1, ycorn1, xcorn2, ycorn1, other, dx, dy) || deep_lines_cross(xcorn1, ycorn2, xcorn2, ycorn2, other, dx, dy)) {
		bar_hor_eff(other.id);	
	}
}
x += spd*dt*cos(theta);
y += -spd*dt*sin(theta);
defspd = a < 0 ? max(defspd+dt*a, minspd) : (a == 0 ? defspd : min(defspd+dt*a, maxspd));
spd = defspd;