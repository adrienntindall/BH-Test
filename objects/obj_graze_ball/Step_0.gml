/// @description Insert description here
// You can write your code in this editor
dt = global.dt;
if(v0 > 0) {
	spd = v0;
	move_linear();
	v0 += a0*dt;
	if(v0 < 0) {
		target = instance_nearest(x, y, obj_enemy);
	}
}
else {
	if(!instance_exists(target) && !target == -2) {
		target = instance_nearest(x, y, obj_enemy);
		if(!instance_exists(target)) {
			random(2*pi); //dispersal mode
			a = 20;	
		}
	}
	theta = (!instance_exists(target)) ? theta : point_direction(x, y, target.x, target.y)*pi/180;	
	spd = v;
	move_linear();
}