/// @description Insert description here
// You can write your code in this editor
with(obj_graze_ball) {
	var ex = findIndex(other.c_types, object_index);
	if(ex != -1 && (other.c_amnts[ex] < other.c_max[ex]) &&  (target == noone || dist_to(other) < other.c_rad)) {
		target = other;
	}
}

if(rotate) {
	x0 = obj_player.x;
	y0 = obj_player.y;
	
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
		move_linear();
	}
}