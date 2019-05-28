///move_eq(x_eq, y_eq)
///@param x_eq
///@param y_eq
var X = tx*argument0 + 2*xacc_dis;
var Y = ty*argument1 + 2*yacc_dis;
var dt = global.dt;

var dx = (X*cos(theta) - Y*sin(theta)) - (x-x0);
var dy = -(Y*cos(theta) + X*sin(theta)) - (y-y0);

if(wall_collision(tilemap, id, dx, dy)) {
	if(is_knife) mode = 2;
	else instance_destroy();
}

with(obj_barrier) {
	if(deep_lines_cross(xcorn2, ycorn2, xcorn2, ycorn1, other, dx, dy) || deep_lines_cross(xcorn1, ycorn2, xcorn1, ycorn1, other, dx, dy)) {
		bar_vert_eff(other.id);
	}
	if(deep_lines_cross(xcorn1, ycorn1, xcorn2, ycorn1, other, dx, dy) || deep_lines_cross(xcorn1, ycorn2, xcorn2, ycorn2, other, dx, dy)) {
		bar_hor_eff(other.id);	
	}
}

x += dx;
y += dy;