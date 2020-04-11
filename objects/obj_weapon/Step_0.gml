/// @description Insert description here
// You can write your code in this editor
dt = global.dt;

with(obj_graze_ball) {
	var ex = findIndex(other.c_types, object_index);
	if(ex != -1 && (other.c_amnts[ex] < other.c_max[ex]) &&  (target == noone || dist_to(other) < other.c_rad)) {
		target = other;
	}
}

if(rotate) {
	theta = point_direction(x0, y0, obj_player.x, obj_player.y)*pi/180;
	var dis = dist_between_point(obj_player, x0, y0);
	spd = dis/defspd;
	x0 += spd*dt*cos(theta);
	y0 -= spd*dt*sin(theta); 
	x = x0+r_rad*cos(2*pi*t/w_spd);
	y = y0+r_rad*sin(2*pi*t/w_spd);
	
	t += global.dt;
}

if(follow)  {
	var dtp = dist_to_player();
	if(dtp > f_rad) {
		dt = global.dt;
		theta = point_direction(x, y, obj_player.x, obj_player.y)*pi/180;
		spd = dtp/defspd;
		wp_move_linear();
	}
}